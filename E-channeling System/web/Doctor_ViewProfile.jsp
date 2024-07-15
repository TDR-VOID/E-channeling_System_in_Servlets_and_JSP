<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Doctor Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
        }
        .navbar {
            overflow: hidden;
            background-color: #333;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }
        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .container {
            margin-top: 50px;
            padding: 20px;
        }
        .profile-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: auto;
        }
        .profile-container label {
            display: block;
            margin: 10px 0 5px;
        }
        .profile-container p {
            margin: 5px 0 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
        }
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 10px;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="Doctor.jsp">View</a>
        <a href="Doctor_Add.jsp">Add</a>
        <a href="Doctor_ViewProfile.jsp">User Profile</a>
        <a href="index.jsp">Logout</a>
    </div>

    <div class="container">
        <h2>View Doctor Profile</h2>
        <div class="profile-container">
            <%
                String doctorID = (String) session.getAttribute("loggedInDoctorID");

                if (doctorID == null) {
                    response.sendRedirect("index.jsp");
                    return;
                }

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String dbURL = "jdbc:mysql://localhost:3306/e-channeling_system";
                    String dbUser = "root";
                    String dbPassword = "";
                    Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                    String sql = "SELECT userID, name, phone, specialization FROM doctors WHERE userID = ?";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, doctorID);
                    ResultSet rs = statement.executeQuery();

                    if (rs.next()) {
                        String name = rs.getString("name");
                        String phone = rs.getString("phone");
                        String specialization = rs.getString("specialization");

                        out.println("<label>User ID:</label>");
                        out.println("<p>" + doctorID + "</p>");
                        out.println("<label>Name:</label>");
                        out.println("<p>" + name + "</p>");
                        out.println("<label>Phone:</label>");
                        out.println("<p>" + phone + "</p>");
                        out.println("<label>Specialization:</label>");
                        out.println("<p>" + specialization + "</p>");
                        out.println("<a href='Doctor_Profile.jsp' class='button'>Edit</a>");
                    } else {
                        out.println("<p>Profile not found.</p>");
                    }

                    rs.close();
                    statement.close();
                    conn.close();
                } catch (SQLException | ClassNotFoundException e) {
                    out.println("Database connection error: " + e.getMessage());
                }
            %>
        </div>
    </div>
</body>
</html>
