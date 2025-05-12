package com.StudentmanagementSystemController;

import java.io.IOException;
import java.util.List;

import com.StudentManagementSystemDAO.StudentManagementSystemDAO;
import com.StudentManagementSystemDTO.StudentManagementSystemDTO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/StudentManagementSystemController_2")
public class StudentManagementSystemController_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentManagementSystemDAO dao = new StudentManagementSystemDAO();
		List<StudentManagementSystemDTO> studentList = dao.show();
		request.setAttribute("students", studentList);
		RequestDispatcher rd = request.getRequestDispatcher("details.jsp");
		rd.forward(request, response);

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentManagementSystemDAO dao = new StudentManagementSystemDAO();
		List<StudentManagementSystemDTO> studentList = dao.show();
		request.setAttribute("students", studentList);
		RequestDispatcher rd = request.getRequestDispatcher("details.jsp");
		rd.forward(request, response);

	}

}
