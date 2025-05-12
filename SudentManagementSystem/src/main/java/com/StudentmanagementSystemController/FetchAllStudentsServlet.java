package com.StudentmanagementSystemController;

import java.io.IOException;
import java.util.List;

import com.StudentManagementSystemDAO.StudentManagementSystemDAO;
import com.StudentManagementSystemDTO.StudentManagementSystemDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FetchAllStudentsServlet")
public class FetchAllStudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StudentManagementSystemDAO dao = new StudentManagementSystemDAO();
		List<StudentManagementSystemDTO> students = dao.show(); // fetch list from DB

		if (students != null && !students.isEmpty()) {
			System.out.println("Students fetched: " + students.size());
		} else {
			System.out.println("No students found.");
		}

		request.setAttribute("students", students); // set list in request scope
		request.getRequestDispatcher("StudentList.jsp").forward(request, response); // forward to JSP
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response); // also handle POST for flexibility
	}
}
