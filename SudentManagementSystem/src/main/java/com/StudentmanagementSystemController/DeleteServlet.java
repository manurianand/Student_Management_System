package com.StudentmanagementSystemController;

import java.io.IOException;

import com.StudentManagementSystemDAO.StudentManagementSystemDAO;
import com.StudentManagementSystemDTO.StudentManagementSystemDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int studentId = Integer.parseInt(request.getParameter("studentid"));
		StudentManagementSystemDTO dto = new StudentManagementSystemDTO();
		dto.setStudentid(studentId);

		StudentManagementSystemDAO dao = new StudentManagementSystemDAO(); // or whatever class has your delete() method
		boolean result = dao.delete(dto);

		if (result) {
		    response.sendRedirect("StudentManagementSystemController_2"); // redirect to refresh the list
		} else {
		    response.getWriter().println("Failed to delete record.");
		}


	}

}
