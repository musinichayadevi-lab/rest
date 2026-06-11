package com.example.project1.Controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.project1.Entity.AdminEntity;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminLoginController {

	private final String url = "jdbc:mysql://localhost:3306/blood_donation";
	private final String dbUser = "root";
	private final String dbPassword = "root";

	@GetMapping("/adminlogin")
	public String showAdminLogin() {
		return "adminlogin";
	}

	@PostMapping("/adminlogin")
	public String adminLogin(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session) {
 
//		String username = request.getParameter("username");
//		String password = request.getParameter("password");
		AdminEntity admin = isValidAdmin(username, password);

		if (admin != null) {
//			HttpSession session = request.getSession();
			session.setAttribute("loggedInAdmin", admin);
			return "redirect:/admin_dashboard";
		}
		return "adminlogin";
	}

	private AdminEntity isValidAdmin(String username, String password) {
		AdminEntity admin = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);
			String sql = "SELECT * FROM admin WHERE username=? AND password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				admin = new AdminEntity(rs.getInt("id"), rs.getString("username"), rs.getString("password"));
			}

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return admin;
	}
}
