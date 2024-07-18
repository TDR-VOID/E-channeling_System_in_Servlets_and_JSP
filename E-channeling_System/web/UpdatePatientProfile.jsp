<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    String patientNIC = request.getParameter("nic");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String dbURL = "jdbc:mysql://localhost:3306/e-channeling_system";
        String dbUser = "root";
        String dbPassword = "";
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        String sql = "UPDATE patients SET name = ?, phone = ?, email = ? WHERE NIC = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, name);
        statement.setString(2, phone);
        statement.setString(3, email);
        statement.setString(4, patientNIC);

        int rowsUpdated = statement.executeUpdate();

        statement.close();
        conn.close();

        if (rowsUpdated > 0) {
            response.sendRedirect("Patient_ViewProfile.jsp");
        } else {
            out.println("<p>Error updating profile. Please try again.</p>");
        }
    } catch (SQLException | ClassNotFoundException e) {
        out.println("Database connection error: " + e.getMessage());
    }
%>
    