package com.StudentmanagementSystemController;

import java.io.IOException;

import com.StudentManagementSystemDAO.StudentManagementSystemDAO;
import com.StudentManagementSystemDTO.StudentManagementSystemDTO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		String username = req.getParameter("username");
		String firstname = req.getParameter("firstname");
		String lastname = req.getParameter("lastname");
		String email = req.getParameter("email");
		String phonenumber = req.getParameter("phonenumber");
		String password = req.getParameter("password");

		StudentManagementSystemDTO student = new StudentManagementSystemDTO();
		student.setUserName(username);
		student.setFirstName(firstname);
		student.setLastName(lastname);
		student.setEmail(email);
		student.setPhoneNumber(phonenumber);
		student.setPassword(password);

		StudentManagementSystemDAO dao = new StudentManagementSystemDAO();
		boolean status = dao.updateStudent(student);

		if (status) {
			RequestDispatcher rd = req.getRequestDispatcher("UpdateSucessful.jsp");
			rd.forward(req, res);
//			res.sendRedirect("StudentManagementSystemController_2");
			// show updated list
		} else {
			res.getWriter().println("Update failed. Please try again.");
		}
//		if (status) {
//		    res.sendRedirect("FetchAllStudentsServlet"); // better than forwarding
//		} else {
//		    res.getWriter().println("Update failed. Please try again.");
//		}

	}
}
