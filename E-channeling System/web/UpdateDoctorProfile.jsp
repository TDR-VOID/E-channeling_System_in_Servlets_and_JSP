<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    String userID = request.getParameter("userID");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String specialization = request.getParameter("specialization");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String dbURL = "jdbc:mysql://localhost:3306/e-channeling_system";
        String dbUser = "root";
        String dbPassword = "";
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        String sql = "UPDATE doctors SET name = ?, phone = ?, specialization = ? WHERE userID = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, name);
        statement.setString(2, phone);
        statement.setString(3, specialization);
        statement.setString(4, userID);
        statement.executeUpdate();

        statement.close();
        conn.close();

        response.sendRedirect("Doctor_ViewProfile.jsp");
    } catch (SQLException | ClassNotFoundException e) {
        out.println("Database connection error: " + e.getMessage());
    }
%>
