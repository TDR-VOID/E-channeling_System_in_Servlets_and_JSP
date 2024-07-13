<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patients Register Page</title>
<style>
  body {
    font-family: Arial, sans-serif;
    text-align: center; /* Center align text content */
  }
  form {
    width: 300px; /* Set a specific width for the form */
    margin: 0 auto; /* Center align the form horizontally */
    text-align: left; /* Align form content to the left within the centered body */
    margin-top: 20px; /* Add space above the form */
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }
  label {
    display: block;
    margin-bottom: 10px;
  }
  input[type="text"], input[type="password"], input[type="submit"],input[type="button"] {
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
  input[type="submit"]:hover,input[type="button"]:hover {
    background-color: #45a049;
  }
</style>
<script>
    function goToLogin(){
      window.location.href = "Patients_Login.jsp";
    }
</script>
</head>
<body>
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
  
  
  <input type="hidden" name="action" value="register">
  <input type="submit" value="Register">
  <input type="button" value="Login" onclick="goToLogin()">
</form>
</body>
</html>
