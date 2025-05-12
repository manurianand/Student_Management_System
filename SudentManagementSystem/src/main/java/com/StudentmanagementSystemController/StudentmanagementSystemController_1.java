package com.StudentmanagementSystemController;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.StudentManagementSystemDAO.StudentManagementSystemDAO;
import com.StudentManagementSystemDTO.StudentManagementSystemDTO;
import com.mysql.cj.Session;

@WebServlet("/loginRegister")
public class StudentmanagementSystemController_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StudentManagementSystemDTO smd = new StudentManagementSystemDTO();

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		smd.setEmail(email); 
		smd.setPassword(password);
		
		System.out.println(password);

		StudentManagementSystemDAO smmd = new StudentManagementSystemDAO();

		StudentManagementSystemDTO st = smmd.select(smd);
		if (st != null) {
			System.out.println("c pass");
			HttpSession h = request.getSession();
			h.setAttribute("std", st);
			RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
			rd.forward(request, response);
		} else {
			System.out.println("c fail");
			RequestDispatcher rd = request.getRequestDispatcher("index1.jsp");
			rd.forward(request, response);
		}

	}

}
