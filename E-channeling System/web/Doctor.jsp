<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Channeling Schedule</title>
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
        <a href="Doctor.jsp">View</a>
        <a href="Doctor_Add.jsp">Add</a>
        <a href="Doctor_Update.jsp">Update</a>
        <a href="Doctor_Delete.jsp">Delete</a>
        <a href="Doctor_Profile.jsp">User Profile</a>
        <a href="Logout.jsp">Logout</a>
    </div>

    <div class="container">
        <h2>Doctor Channeling Schedule</h2>
        <table>
            <tr>
                <th>No</th>
                <th>Doctor ID</th>
                <th>Channel Number</th>
                <th>Date</th>
                <th>Time</th>
                <th>Max Patients</th>
                <th>Current Patients</th>
                <th>Action</th>
            </tr>
            <% 
                // Fetch and display channeling schedules for the logged-in doctor
                String loggedInDoctorID = (String)request.getSession().getAttribute("loggedInDoctorID");
                int counter =1; //Initialize counter for row numbering
              
                try {
                    // Load MySQL JDBC driver and establish connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String dbURL = "jdbc:mysql://localhost:3306/e-channeling_system";
                    String dbUser = "root";
                    String dbPassword = "";
                    Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                    // Query to fetch channeling schedules
                    String sql = "SELECT * FROM channeling_schedule WHERE doctor_id = ?";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, loggedInDoctorID);
                    ResultSet rs = statement.executeQuery();

                    // Iterate through results and display in table rows
                    while (rs.next()) {
                        int channelNumber = rs.getInt("id"); // Assuming 'id' is the auto-incremented channel number
                        String date = rs.getString("channeling_date");
                        String time = rs.getString("time");
                        int maxPatients = rs.getInt("max_patients");
                        int currentPatients = rs.getInt("current_patients");
                        int scheduleID = rs.getInt("id");

                        // Display each schedule row
                        out.println("<tr>");
                        out.println("<td>" + counter + "</td>");
                        out.println("<td>" + loggedInDoctorID + "</td>");
                        out.println("<td>" + channelNumber + "</td>");
                        out.println("<td>" + date + "</td>");
                        out.println("<td>" + time + "</td>");
                        out.println("<td>" + maxPatients + "</td>");
                        out.println("<td>" + currentPatients + "</td>");
                        out.println("<td><a href='Doctor_Update.jsp?id=" + channelNumber + "' class='button'>Update</a> | <a href ='Doctor_Delete.jsp?id="+ scheduleID+"'class='button'>Delete</a></td>");
                        out.println("</tr>");
                        
                        counter++;
                    }

                    // Close connections
                    rs.close();
                    statement.close();
                    conn.close();
                } catch (SQLException | ClassNotFoundException e) {
                    out.println("Database connection error: " + e.getMessage());
                }
            %>
        </table>
        <a href="Doctor_Add.jsp" class="button" style="margin-top: 10px;">Add New Schedule</a>
    </div>
</body>
</html>
