<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Validation Page</title>
</head>
<body>
<%
    String action = request.getParameter("action");
    
   if ("doctor_login".equals(action)) {
        String _docUserID = request.getParameter("doc_userID");
        String _docPassword = request.getParameter("doc_password");

        if (_docUserID != null && _docPassword != null) {
            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Database URL, username, and password
                String dbURL = "jdbc:mysql://localhost:3306/e-channeling_system";
                String dbUser = "root"; // Default XAMPP MySQL user
                String dbPassword = ""; // Default XAMPP MySQL password

                // Connect to the database
                Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // Prepare SQL statement to query doctor credentials
                String sql = "SELECT * FROM doctors WHERE userID = ? AND password = ?";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, _docUserID);
                statement.setString(2, _docPassword);

                // Execute the query
                ResultSet result = statement.executeQuery();

                // Check if user exists
                if (result.next()) {
                    // Valid user, redirect to Welcome.jsp
                    String loggedInDoctorID = result.getString("userID"); // Adjust column name accordingly
                    session.setAttribute("loggedInDoctorID", loggedInDoctorID);
                    request.getSession().setAttribute("loggedInDoctorID", _docUserID);
                    response.sendRedirect("Doctor.jsp");
                    conn.close(); // Close connection after redirect
                } else {
                    // Invalid credentials
                    out.println("Invalid username or password");
                }

                // Close resources
                result.close();
                statement.close();
                conn.close();

            } catch (SQLException | ClassNotFoundException e) {
                out.println("Database connection error: " + e.getMessage());
            }
        } else {
            out.println("Empty username or password");
        }
    } else if ("doctor_register".equals(action)) {
        String _docUserID = request.getParameter("doc_userID");
        String _docName = request.getParameter("doc_name");
        String _docPassword = request.getParameter("doc_password");
        String _docPhone = request.getParameter("doc_phone");
        String _docSpecialization = request.getParameter("doc_specialization");

        if (_docUserID != null && _docName != null && _docPassword != null && _docPhone != null && _docSpecialization != null) {
            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Database URL, username, and password
                String dbURL = "jdbc:mysql://localhost:3306/e-channeling_system";
                String dbUser = "root"; // Default XAMPP MySQL user
                String dbPassword = ""; // Default XAMPP MySQL password

                // Connect to the database
                Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // Prepare SQL statement to insert new doctor
                String sql = "INSERT INTO doctors (userID, name, password, phone, specialization) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, _docUserID);
                statement.setString(2, _docName);
                statement.setString(3, _docPassword);
                statement.setString(4, _docPhone);
                statement.setString(5, _docSpecialization);

                // Execute the update
                int rowsInserted = statement.executeUpdate();

                // Check if the insertion was successful
                if (rowsInserted > 0) {
                    out.println("Doctor registered successfully!");
                    response.sendRedirect("Doctor_Login.jsp");
                    
                } else {
                    out.println("Error occurred while registering doctor.");
                }

                // Close resources
                statement.close();
                conn.close();

            } catch (SQLException | ClassNotFoundException e) {
                out.println("Database connection error: " + e.getMessage());
            }
        } else {
            out.println("All fields are required");
        }
    } else if ("patient_login".equals(action)) {
        String _patientNIC = request.getParameter("patient_NIC");
        String _patientPassword = request.getParameter("patient_password");

        if (_patientNIC != null && _patientPassword != null) {
            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Database URL, username, and password
                String dbURL = "jdbc:mysql://localhost:3306/e-channeling_system";
                String dbUser = "root"; // Default XAMPP MySQL user
                String dbPassword = ""; // Default XAMPP MySQL password

                // Connect to the database
                Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // Prepare SQL statement to query patient credentials
                String sql = "SELECT * FROM patients WHERE NIC = ? AND password = ?";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, _patientNIC);
                statement.setString(2, _patientPassword);

                // Execute the query
                ResultSet result = statement.executeQuery();

                // Check if user exists
                if (result.next()) {
                    // Valid user, redirect to Welcome.jsp or patient specific page
                    String loggedInPatientName = result.getString("name"); // Get the patient's name
                    session.setAttribute("loggedInPatientName", loggedInPatientName); // Store the patient's name in the session
                    session.setAttribute("loggedInPatientNIC", _patientNIC); // Store the patient's NIC in the session
                    response.sendRedirect("Patient.jsp");
                } else {
                    // Invalid credentials
                    out.println("Invalid NIC or password");
                }

                // Close resources
                result.close();
                statement.close();
                conn.close();

            } catch (SQLException | ClassNotFoundException e) {
                out.println("Database connection error: " + e.getMessage());
            }
        } else {
            out.println("Empty NIC or password");
        }
    } else if ("patient_register".equals(action)) {
        String _patientNIC = request.getParameter("patient_NIC");
        String _patientName = request.getParameter("patient_name");
        String _patientPassword = request.getParameter("patient_password");
        String _patientPhone = request.getParameter("patient_phone");

        if (_patientNIC != null && _patientName != null && _patientPassword != null && _patientPhone != null) {
            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Database URL, username, and password
                String dbURL = "jdbc:mysql://localhost:3306/e-channeling_system";
                String dbUser = "root"; // Default XAMPP MySQL user
                String dbPassword = ""; // Default XAMPP MySQL password

                // Connect to the database
                Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // Prepare SQL statement to insert new patient
                String sql = "INSERT INTO patients (NIC, name, password, phone) VALUES (?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, _patientNIC);
                statement.setString(2, _patientName);
                statement.setString(3, _patientPassword);
                statement.setString(4, _patientPhone);

                // Execute the update
                int rowsInserted = statement.executeUpdate();

                // Check if the insertion was successful
                if (rowsInserted > 0) {
                    response.sendRedirect("Patients_Login.jsp");
                    out.println("Patient registered successfully!");
                } else {
                    out.println("Error occurred while registering patient.");
                }

                // Close resources
                statement.close();
                conn.close();

            } catch (SQLException | ClassNotFoundException e) {
                out.println("Database connection error: " + e.getMessage());
            }
        } else {
            out.println("All fields are required");
        }
    }
%>
</body>
</html>
