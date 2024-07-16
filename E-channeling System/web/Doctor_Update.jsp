<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Doctor Channeling Schedule</title>
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
            margin-right: 10px;
            font-size: 16px;
        }
        .button:hover {
            background-color: #45a049;
        }
        .button.secondary {
            background-color: #f44336;
        }
        .button.secondary:hover {
            background-color: #da190b;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="Doctor.jsp"><b>Channeling Schedule</b></a>
        <a href="Doctor_Add.jsp"><b>Add New Schedule</b></a>
        <a href="Doctor_ViewProfile.jsp"><b>User Profile</b></a>
        <a href="index.jsp"><b>Logout</b></a>
    </div>

    <div class="container">
        <div class="newcontainer">
        <h1>Update Doctor Channeling Schedule</h1>
        </div>
        <form action="UpdateChannelingServlet" method="post">
            <div class="form-group">
                <label for="doctorID">Doctor ID:</label>
                <input type="text" id="doctorID" name="doctorID" value="<%= request.getSession().getAttribute("loggedInDoctorID") %>" readonly>
            </div>
            <div class="form-group">
                <label for="channelNumber">Channel Number:</label>
                <input type="text" id="channelNumber" name="channelNumber" value="<%= request.getParameter("id") %>" readonly>
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
            <button type="submit" class="button">Confirm Update</button>
            <a href="Doctor.jsp" class="button secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
