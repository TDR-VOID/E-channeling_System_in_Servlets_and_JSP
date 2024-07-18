<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Profile</title>
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
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .navbar a.active {
            background-color: #f0f0f0;
            color: black;
        }
        .container {
            margin-top: 50px;
            padding: 20px;
        }
        
        .newcontainer {
            margin-top: 50px;
            padding: 20px;
            text-align: center;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: auto;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            text-decoration: none;
            margin-right: 10px;
            font-size: 16px;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="Doctor.jsp"><b>Channeling Schedule</b></a>
        <a href="Doctor_Add.jsp"><b>Add New Schedule</b></a>
        <a href="Doctor_ViewProfile.jsp" class="active"><b>User Profile</b></a>
        <a href="index.jsp"><b>Logout</b></a>
    </div>

    <div class="container">
        <div class="newcontainer">
        <h1>Edit Doctor Profile</h1>
        </div>
        <%
            String doctorUserID = (String) session.getAttribute("loggedInDoctorID");

            if (doctorUserID == null) {
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
                statement.setString(1, doctorUserID);
                ResultSet rs = statement.executeQuery();

                if (rs.next()) {
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String specialization = rs.getString("specialization");

                    out.println("<form action='UpdateDoctorProfile.jsp' method='POST'>");
                    out.println("<label for='userID'>UserID:</label>");
                    out.println("<input type='text' id='userID' name='userID' value='" + doctorUserID + "' readonly>");
                    out.println("<label for='name'>Name:</label>");
                    out.println("<input type='text' id='name' name='name' value='" + name + "'>");
                    out.println("<label for='phone'>Phone:</label>");
                    out.println("<input type='text' id='phone' name='phone' value='" + phone + "'>");
                    out.println("<label for='specialization'>Specialization:</label>");
                    out.println("<input type='text' id='specialization' name='specialization' value='" + specialization + "'>");
                    out.println("<button type='submit' class='button'>Save</button>");
                    out.println("<a href='Doctor_ViewProfile.jsp' class='button'>Cancel</a>");
                    out.println("</form>");
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
</body>
</html>
