<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to E-Channeling System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            text-align: center;
            margin-top: 50px; /* Adjusted margin-top for better positioning */
        }
        .container {
            width: 90%;
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .image-container {
            text-align: center;
            margin-bottom: 20px;
        }
        .image-container img {
            width: 100%;
            max-width: 400px;
            border-radius: 8px;
        }
        h1 {
            color: #333;
            font-size: 2.5rem; /* Adjusted font size for the main title */
            margin-bottom: 10px; /* Added margin for spacing */
        }
        .button {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 12px 24px; /* Increased padding for larger buttons */
            text-decoration: none;
            margin: 10px;
            border-radius: 8px; /* Rounded corners for buttons */
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 1.1rem; /* Increased font size for better readability */
            border: none; /* Removed default button border */
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to</h1>
        <h1>E-Channeling System</h1>
        <div class="image-container">
            <img src="img.jpg" alt="E-Channeling System">
        </div>
        <a href="Doctor_Login.jsp" class="button">For Doctors</a>
        <a href="Patients_Login.jsp" class="button">For Patients</a>
    </div>
</body>
</html>
