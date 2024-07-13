<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Doctor Channeling Schedule</title>
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
        form {
            width: 50%;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
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
        <h2>Add Doctor Channeling Schedule</h2>
        <form action="AddChannelingServlet" method="post">
            <div class="form-group">
                <label for="doctorID">Doctor ID:</label>
                <input type="text" id="doctorID" name="doctorID" value="<%= request.getSession().getAttribute("loggedInDoctorID") %>" readonly>
            </div>
            <div class="form-group">
                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required>
            </div>
            <div class="form-group">
                <label for="time">Time:</label>
                <input type="time" id="time" name="time" required>
            </div>
            <div class="form-group">
                <label for="maxPatients">Max Patients:</label>
                <input type="number" id="maxPatients" name="maxPatients" min="1" required>
            </div>
            <button type="submit" class="button">Add Schedule</button>
        </form>
    </div>
</body>
</html>
