package com.StudentmanagementSystemController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.StudentManagementSystemDAO.StudentManagementSystemDAO;
import com.StudentManagementSystemDTO.StudentManagementSystemDTO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("query").toLowerCase();
        List<StudentManagementSystemDTO> allStudents = StudentManagementSystemDAO.getAllStudents(); // assume this returns all students
        List<StudentManagementSystemDTO> filtered = new ArrayList<>();

        for (StudentManagementSystemDTO student : allStudents) {
            if (student.getUserName().toLowerCase().contains(query) ||
                student.getFirstName().toLowerCase().contains(query) ||
                student.getEmail().toLowerCase().contains(query) ||
                String.valueOf(student.getStudentid()).contains(query)) {
                filtered.add(student);
            }
        }

        request.setAttribute("students", filtered);
        RequestDispatcher rd = request.getRequestDispatcher("details.jsp");
        rd.forward(request, response);
    }
}
