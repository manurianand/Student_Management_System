package com.StudentmanagementSystemController;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.StudentManagementSystemDAO.StudentManagementSystemDAO;
import com.StudentManagementSystemDTO.StudentManagementSystemDTO;

/**
 * Servlet implementation class StudentManagementSystemController
 */
@WebServlet("/StudentRegister")
public class StudentManagementSystemController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String firstname = request.getParameter("firstName");
		String lastname = request.getParameter("lastName");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		String password = request.getParameter("password");
		System.out.println(password);
		
		StudentManagementSystemDTO smd=new StudentManagementSystemDTO();
		smd.setUserName(username);
		smd.setFirstName(firstname);
		smd.setLastName(lastname);
		smd.setEmail(email);
		smd.setPhoneNumber(phonenumber);
		smd.setPassword(password);
		StudentManagementSystemDAO smmd=new StudentManagementSystemDAO();
		String status =smmd.insert(smd);
		if(status.equals("success")) {
			System.out.println(status);
			System.out.println("sucessfull");
			 RequestDispatcher rd=request.getRequestDispatcher("index1.jsp");
			 rd.forward(request, response);
			
		}else {
			 RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			 rd.forward(request, response);
			System.out.println("not sucessfull");
			
		}
		

	}

}
