<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Confirmed Appointments</title>
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
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .container {
            margin-top: 50px;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 8px 12px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            text-decoration: none;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="Patient.jsp">Patient</a>
        <a href="Patient_Appointment_List.jsp">Appointment List</a>
        <a href="Patient_Appointments.jsp">My Appointments</a>
        <a href="Patient_Profile.jsp">User Profile</a>
        <a href="index.jsp">Logout</a>
    </div>

    <div class="container">
        <h2>My Confirmed Appointments</h2>
        <table>
            <tr>
                <th>No</th>
                <th>Doctor ID</th>
                <th>Doctor Name</th>
                <th>Channel Number</th>
                <th>Date</th>
                <th>Time</th>
                <th>Action</th>
            </tr>
            <%
                int counter = 1;
                String patientNIC = (String) session.getAttribute("loggedInPatientNIC");

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String dbURL = "jdbc:mysql://localhost:3306/e-channeling_system";
                    String dbUser = "root";
                    String dbPassword = "";
                    Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                    // Query to fetch confirmed appointments for the logged-in patient
                    String sql = "SELECT cs.id, cs.doctor_id, cs.channeling_date, cs.time, d.name as doctor_name " +
                                 "FROM channeling_schedule cs " +
                                 "JOIN doctors d ON cs.doctor_id = d.userID " +
                                 "JOIN appointments a ON cs.id = a.channeling_schedule_id " +
                                 "WHERE a.patient_nic = ?";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, patientNIC);
                    ResultSet rs = statement.executeQuery();

                    // Iterate through results and display in table rows
                    while (rs.next()) {
                        int channelNumber = rs.getInt("id");
                        String doctorID = rs.getString("doctor_id");
                        String doctorName = rs.getString("doctor_name");
                        String date = rs.getString("channeling_date");
                        String time = rs.getString("time");

                        out.println("<tr>");
                        out.println("<td>" + counter + "</td>");
                        out.println("<td>" + doctorID + "</td>");
                        out.println("<td>" + doctorName + "</td>");
                        out.println("<td>" + channelNumber + "</td>");
                        out.println("<td>" + date + "</td>");
                        out.println("<td>" + time + "</td>");
                        out.println("<td><a href='Patient_Appointment_Cancel.jsp?id=" + channelNumber + "' class='button'>Cancel</a></td>");
                        out.println("</tr>");

                        counter++;
                    }

                    rs.close();
                    statement.close();
                    conn.close();
                } catch (SQLException | ClassNotFoundException e) {
                    out.println("Database connection error: " + e.getMessage());
                }
            %>
        </table>
    </div>
</body>
</html>
