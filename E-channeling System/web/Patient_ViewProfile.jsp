<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
        }
        .navbar {
            overflow: hidden;
            background-color: #333;
            position: fixed; /* Fixed to the top */
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
        .profile {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: auto;
        }
        .profile label {
            display: block;
            margin: 10px 0 5px;
        }
        .profile p {
            padding: 10px;
            background-color: #f0f0f0;
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
            margin-top: 10px;
            display: inline-block;
        }
        .button:hover {
            background-color: #45a049;
        }
        .patient-name{
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="Patient.jsp"><b>Appointments</b></a>
        <a href="Patient_Appointment_List.jsp"><b>Full Appointment List</b></a>
        <a href="Patient_Appointments.jsp"><b>Confirmed Appointments List</b></a>
        <a href="Patient_ViewProfile.jsp" class="active"><b>User Profile</b></a>
        <a href="index.jsp"><b>Logout</b></a>
    </div>

    <div class="container">
        <h1 class="patient-name">Patient Profile</h1>
        <div class="profile">
            <%
                String patientNIC = (String) session.getAttribute("loggedInPatientNIC");

                if (patientNIC == null) {
                    response.sendRedirect("index.jsp");
                    return;
                }

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String dbURL = "jdbc:mysql://localhost:3306/e-channeling_system";
                    String dbUser = "root";
                    String dbPassword = "";
                    Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                    String sql = "SELECT NIC, name, phone, email FROM patients WHERE NIC = ?";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, patientNIC);
                    ResultSet rs = statement.executeQuery();

                    if (rs.next()) {
                        String name = rs.getString("name");
                        String phone = rs.getString("phone");
                        String email = rs.getString("email");

                        out.println("<label for='nic'>NIC:</label>");
                        out.println("<p id='nic'>" + patientNIC + "</p>");
                        out.println("<label for='name'>Name:</label>");
                        out.println("<p id='name'>" + name + "</p>");
                        out.println("<label for='phone'>Phone:</label>");
                        out.println("<p id='phone'>" + phone + "</p>");
                        out.println("<label for='email'>Email:</label>");
                        out.println("<p id='email'>" + email + "</p>");
                        out.println("<a href='Patient_Profile.jsp' class='button'>Edit</a>");
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
