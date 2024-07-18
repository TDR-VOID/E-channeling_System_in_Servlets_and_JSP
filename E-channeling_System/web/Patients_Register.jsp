<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patients Register Page</title>
<style>
  body {
    font-family: Arial, sans-serif;
    text-align: center;
    background-color: #f0f0f0;
    margin-top: 50px; /* Adjusted margin-top for better positioning */
  }
  .container {
    width: 90%;
    max-width: 400px; /* Adjusted maximum width for the form container */
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
    max-width: 200px; /* Adjusted maximum width for the image */
    border-radius: 50%; /* Rounded border for circular effect */
  }
  form {
    text-align: left;
    margin-top: 20px;
  }
  label {
    display: block;
    margin-bottom: 10px;
  }
  input[type="text"], input[type="password"], input[type="submit"], input[type="button"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
  }
  input[type="submit"], input[type="button"] {
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
  }
  input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #45a049;
  }
</style>
<script>
  function goToLogin() {
    window.location.href = "Patients_Login.jsp";
  }
</script>
</head>
<body>
<div class="container">
  <div class="image-container">
    <img src="./src/doctor_r.jpg" alt="Patient Image">
  </div>
  <h2>Patients Register Page</h2>
  <form action="Validation.jsp" method="post">
    <label for="patient_NIC">Patient NIC:</label>
    <input type="text" id="patient_NIC" name="patient_NIC" required>
    
    <label for="patient_name">Name:</label>
    <input type="text" id="patient_name" name="patient_name" required>
    
    <label for="patient_password">Password:</label>
    <input type="password" id="patient_password" name="patient_password" required>
    
    <label for="patient_phone">Phone:</label>
    <input type="text" id="patient_phone" name="patient_phone" required>
    
    <input type="hidden" name="action" value="patient_register">
    <input type="submit" value="Register">
    <input type="button" value="Login" onclick="goToLogin()">
  </form>
</div>
</body>
</html>
