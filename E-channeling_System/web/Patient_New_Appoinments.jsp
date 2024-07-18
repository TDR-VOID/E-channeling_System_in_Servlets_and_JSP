<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Appointment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        table {
            width: 100%;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .button-container {
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        .button {
            display: block;
            padding: 10px;
            text-align: center;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-bottom: 10px;
            flex: 1;
            text-align: center;
        }
        .button:hover {
            background-color: #45a049;
        }
        .title {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">Confirm Appointment</h1>
        <br>
        <br>
        <%
            String channelNumber = request.getParameter("id");
            String patientID = (String)session.getAttribute("loggedInPatientNIC");
            String patientName = (String)session.getAttribute("loggedInPatientName");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String dbURL = "jdbc:mysql://localhost:3306/e-channeling_system";
                String dbUser = "root";
                String dbPassword = "";
                Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // Begin transaction for atomicity
                conn.setAutoCommit(false);

                // Query to fetch the selected appointment details
                String fetchAppointmentSQL = "SELECT cs.id, cs.doctor_id, cs.channeling_date, cs.time, cs.max_patients, cs.current_patients, d.name as doctor_name " +
                                             "FROM channeling_schedule cs " +
                                             "JOIN doctors d ON cs.doctor_id = d.userID " +
                                             "WHERE cs.id = ?";
                PreparedStatement fetchStatement = conn.prepareStatement(fetchAppointmentSQL);
                fetchStatement.setInt(1, Integer.parseInt(channelNumber));
                ResultSet rs = fetchStatement.executeQuery();

                if (rs.next()) {
                    String doctorID = rs.getString("doctor_id");
                    String doctorName = rs.getString("doctor_name");
                    String date = rs.getString("channeling_date");
                    String time = rs.getString("time");
                    int maxPatients = rs.getInt("max_patients");
                    int currentPatients = rs.getInt("current_patients");
                    int token = maxPatients - currentPatients;

                    // Display the selected appointment details
                    out.println("<table>");
                    out.println("<tr><th>Doctor ID</th><td>" + doctorID + "</td></tr>");
                    out.println("<tr><th>Doctor Name</th><td>" + doctorName + "</td></tr>");
                    out.println("<tr><th>Channel ID</th><td>" + channelNumber + "</td></tr>");
                    out.println("<tr><th>Date</th><td>" + date + "</td></tr>");
                    out.println("<tr><th>Time</th><td>" + time + "</td></tr>");
                    out.println("<tr><th>No of tokens Available</th><td>" + token + "</td></tr>");
                    out.println("</table>");

                    // Display the logged-in patient's name
                    out.println("<h3>Patient Name: " + patientName + "</h3>");
                    out.println("<h3>Patient NIC: "+ patientID + "</h3>");

                    // Update current_patients count
                    int newCurrentPatients = currentPatients + 1;
                    String updateSQL = "UPDATE channeling_schedule SET current_patients = ? WHERE id = ?";
                    PreparedStatement updateStatement = conn.prepareStatement(updateSQL);
                    updateStatement.setInt(1, newCurrentPatients);
                    updateStatement.setInt(2, Integer.parseInt(channelNumber));
                    updateStatement.executeUpdate();

                    // Commit transaction
                    conn.commit();
                    updateStatement.close();
                }

                rs.close();
                fetchStatement.close();
                conn.close();
            } catch (SQLException | ClassNotFoundException e) {
                out.println("Database connection error: " + e.getMessage());
            }
        %>
        <div class="button-container">
            <a href="confirm_booking.jsp?id=<%=channelNumber%>" class="button">Confirm Appointment</a>
            <a href="Patient.jsp" class="button">Cancel</a>
        </div>
    </div>
</body>
</html>
