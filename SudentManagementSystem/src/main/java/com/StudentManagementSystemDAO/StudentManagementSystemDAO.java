package com.StudentManagementSystemDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.StudentManagementSystemDTO.StudentManagementSystemDTO;

public class StudentManagementSystemDAO {

	public String insert(StudentManagementSystemDTO smd) {
		String status = "false";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try {
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/batch54", "root", "root");
				PreparedStatement pr = con.prepareStatement(
						"insert into studentmanagementsystem(username,firstname,lastname,email,phonenumber,password) values(?,?,?,?,?,?)");
				pr.setString(1, smd.getUserName());
				pr.setString(2, smd.getFirstName());
				pr.setString(3, smd.getLastName());
				pr.setString(4, smd.getEmail());
				pr.setString(5, smd.getPhoneNumber());
				pr.setString(6, smd.getPassword());

				int i = pr.executeUpdate();
				if (i > 0) {
					status = "success";
					System.out.println(status);
					System.out.println("hhhhhh");
				} else {
					System.out.println("no rows effected");
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return status;
	}
//	*********************************************************************************************

	public StudentManagementSystemDTO select(StudentManagementSystemDTO smd) {
		StudentManagementSystemDTO st=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try {
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/batch54", "root", "root");
				PreparedStatement pr = con
						.prepareStatement("select * from studentmanagementsystem where email=? and password =?");
				pr.setString(1, smd.getEmail());
				pr.setString(2, smd.getPassword());
				System.out.println("Email: " + smd.getEmail());
				System.out.println("Password: " + smd.getPassword());
				try (ResultSet rs = pr.executeQuery()) {
					if (rs.next()) {
					 st=new StudentManagementSystemDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
						
						System.out.println("Login successful");
					} else {
						System.out.println("Login failed: index 1 fail");
					}
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (Exception e) {

		}
		return st;

	}

//	*********************************************************************************************
	public List<StudentManagementSystemDTO> show() {
		List<StudentManagementSystemDTO> list = new ArrayList<>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/batch54", "root", "root");
			PreparedStatement pr = con.prepareStatement("SELECT * FROM studentmanagementsystem");
			ResultSet rs = pr.executeQuery();

			while (rs.next()) {
				StudentManagementSystemDTO s = new StudentManagementSystemDTO();
				s.setStudentid(rs.getInt("studentid"));
				s.setUserName(rs.getString("username"));
				s.setFirstName(rs.getString("firstname"));
				s.setLastName(rs.getString("lastname"));
				s.setEmail(rs.getString("email"));
				s.setPhoneNumber(rs.getString("phonenumber"));
				s.setPassword(rs.getString("password"));
				list.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

//	**********************************************************
	public void update(StudentManagementSystemDTO dto) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/batch54", "root", "root");

			PreparedStatement ps = con.prepareStatement(
					"UPDATE studentmanagementsystem SET studentis = ?,username=?, firstname=?, lastname=?, phonenumber=?, password=? WHERE email=?");
			ps.setInt(1, dto.getStudentid());
			ps.setString(2, dto.getUserName());
			ps.setString(3, dto.getFirstName());
			ps.setString(4, dto.getLastName());
			ps.setString(5, dto.getPhoneNumber());
			ps.setString(6, dto.getPassword());
			ps.setString(7, dto.getEmail());

			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//******************************************************************************************************

	public boolean updateStudent(StudentManagementSystemDTO s) {
		boolean result = false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/batch54", "root", "root");

			String query = "UPDATE studentmanagementsystem SET username=?, firstname=?, lastname=?, phonenumber=?, password=? WHERE email=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, s.getUserName());
			ps.setString(2, s.getFirstName());
			ps.setString(3, s.getLastName());
			ps.setString(4, s.getPhoneNumber());
			ps.setString(5, s.getPassword());
			ps.setString(6, s.getEmail());

			int rowsUpdated = ps.executeUpdate();
			if (rowsUpdated > 0) {
				System.out.println("pass in if");
				result = true;
			} else {
				System.out.println("fail in if");
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

//	*********************************************************************************************
	public boolean delete(StudentManagementSystemDTO s) {
	    boolean result = false;
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/batch54", "root", "root");
	             PreparedStatement ps = con.prepareStatement("DELETE FROM studentmanagementsystem WHERE studentid = ?")) {
	             
	            ps.setInt(1, s.getStudentid());
	            int rowsUpdated = ps.executeUpdate();
	            
	            if (rowsUpdated > 0) {
	                System.out.println("Student record deleted successfully.");
	                result = true;
	            } else {
	                System.out.println("No student found with the given ID.");
	            }
	        }
	    } catch (Exception e) {
	        System.err.println("Error during deletion:");
	        e.printStackTrace();
	    }
	    return result;
	}
	//**************************************************************************************
	public static List<StudentManagementSystemDTO> getAllStudents() {
        List<StudentManagementSystemDTO> studentList = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
	        Class.forName("com.mysql.cj.jdbc.Driver");

            // Assuming you have a DBConnection class to get a connection
            String sql = "SELECT * FROM students";  // Replace 'students' with your table name

           conn =DriverManager.getConnection(sql);
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                StudentManagementSystemDTO student = new StudentManagementSystemDTO();
                student.setStudentid(rs.getInt("studentid"));
                student.setUserName(rs.getString("username"));
                student.setFirstName(rs.getString("firstname"));
                student.setLastName(rs.getString("lastname"));
                student.setEmail(rs.getString("email"));
                student.setPhoneNumber(rs.getString("phonenumber"));
                student.setPassword(rs.getString("password"));
                studentList.add(student);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return studentList;
    }
}
