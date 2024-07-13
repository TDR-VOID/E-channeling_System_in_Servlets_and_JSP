<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Channeling Schedule</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
        }
        .container {
            margin-top: 50px;
            padding: 20px;
        }
        table {
            width: 50%;
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
            background-color: #f44336;
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
    <div class="container">
        <h2>Delete Channeling Schedule</h2>
        <table>
            <tr>
                <th>Doctor ID</th>
                <th>Channel Number</th>
                <th>Date</th>
                <th>Time</th>
                <th>Max Patients</th>
                <th>Current Patients</th>
            </tr>
            <% 
                // Retrieve schedule ID from request parameter
                int scheduleID = Integer.parseInt(request.getParameter("id"));

                try {
                    // Load MySQL JDBC driver and establish connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String dbURL = "jdbc:mysql://localhost:3306/e-channeling_system";
                    String dbUser = "root";
                    String dbPassword = "";
                    Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                    // Query to fetch channeling schedule details by ID
                    String sql = "SELECT * FROM channeling_schedule WHERE id = ?";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setInt(1, scheduleID);
                    ResultSet rs = statement.executeQuery();

                    // Display schedule details
                    if (rs.next()) {
                        String doctorID = rs.getString("doctor_id");
                        String date = rs.getString("channeling_date");
                        String time = rs.getString("time");
                        int maxPatients = rs.getInt("max_patients");
                        int currentPatients = rs.getInt("current_patients");

                        // Display schedule details in table row
                        out.println("<tr>");
                        out.println("<td>" + doctorID + "</td>");
                        out.println("<td>" + scheduleID + "</td>");
                        out.println("<td>" + date + "</td>");
                        out.println("<td>" + time + "</td>");
                        out.println("<td>" + maxPatients + "</td>");
                        out.println("<td>" + currentPatients + "</td>");
                        out.println("</tr>");
                    } else {
                        out.println("<tr><td colspan='6'>Schedule not found</td></tr>");
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
        <form action="DeleteChannelingServlet" method="post">
            <input type="hidden" name="scheduleID" value="<%= scheduleID %>">
            <button type="submit" class="button">Confirm Delete</button>
            <a href="Doctor.jsp" class="button" style="margin-left: 10px;">Cancel</a>
        </form>
    </div>
</body>
</html>
