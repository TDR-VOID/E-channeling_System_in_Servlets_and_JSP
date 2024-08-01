# E-channeling System in Servlets and JSP

## Overview
The E-channeling System is a web-based application developed using Java Servlets and JSP, aimed at facilitating the appointment booking process between doctors and patients. This system allows doctors to manage their channelling schedules and patients to book appointments, view their schedules, and manage their profiles. The system ensures data persistence by storing all information in a MySQL database.

For detailed project requirements, please refer to the [E-channeling System Requirements.pdf](doc/E-channeling_System_Requirements.pdf)


Screenshots of the key pages in the E-Channeling System:

<details>
<summary>Welcome Page</summary>
<img src="screenshots/welcome_page.png" alt="Welcome Page" width="800" />
</details>

<details>
<summary>Doctor Login Page </summary>
<img src="screenshots/doctor_login.png" alt="Doctor Login Page" width="800" />
</details>
   
<details>
<summary>Doctor Register Page</summary>
<img src="screenshots/doctor_register.png" alt="Doctor Register Page" width="800" />
</details>

<details>
<summary>Doctor Channeling Schedule Page</summary>
<img src="screenshots/doctor_channeling_schedule.png" alt="Doctor Channeling Schedule Page" width="800" />
</details>

<details>
<summary>Doctor Add New Schedule Page</summary>
<img src="screenshots/doctor_add_new_schedule.png" alt="Doctor Add New Schedule Page" width="800" />
</details>

<details>
<summary>Doctor Update Channeling Schedule Page</summary>
<img src="screenshots/doctor_update_uhanneling_schedule.png" alt="Doctor Update Channeling Schedule Page" width="800" />
</details>

<details>
<summary>Doctor Delete Schedule Page</summary>
<img src="screenshots/doctor_delete_schedule.png" alt="Doctor Delete Schedule Page" width="800" />
</details>

<details>
<summary>Doctor User Profile Page</summary>
<img src="screenshots/doctor_user_profile.png" alt="Doctor User Profile Page" width="800" />
</details>

<details>
<summary>Doctor Edit User Profile Page</summary>
<img src="screenshots/doctor_edit_user_profile.png" alt="Doctor Edit User Profile Page" width="800" />
</details>
<details>
<summary>Patient Login Page</summary>
<img src="screenshots/patient_login.png" alt="Patient Login Page" width="800" />
</details>

<details>
<summary>Patient Register Page</summary>
<img src="screenshots/patient_register.png" alt="Patient Register Page" width="800" />
</details>

<details>
<summary>Patient Appointment List View Page</summary>
<img src="screenshots/patient_appointment_list_view.png" alt="Patient Appointment List View Page" width="800" />
</details>

<details>
<summary>Full Appointment List View Page</summary>
<img src="screenshots/full_appointment_list.png" alt="Full Appointment List View Page" width="800" />
</details>

<details>
<summary>Patient Confirmed Appointment List View Page</summary>
<img src="screenshots/patient_confirmed_appointment_list.png" alt="Confirmed Appointment List View Page" width="800" />
</details>

<details>
<summary>Patient User Profile Page</summary>
<img src="screenshots/patient_user_profile.png" alt="Patient User Profile Page" width="800" />
</details>

<details>
<summary>Patient Edit User Profile Page</summary>
<img src="screenshots/patient_edit_user_profile.png" alt="Patient Edit User Profile Page" width="800" />
</details>

<details>
<summary>Patient Confirm Appointment Page</summary>
<img src="screenshots/patient_confirm_appointment.png" alt="Patient Confirm Appointment Page" width="800" />
</details>

<details>
<summary>Patient Cancel Appointment Page</summary>
<img src="screenshots/patient_cancel_appointment.png" alt="Patient Cancel Appointment Page" width="800" />
</details>



<br>

## Use Case Diagram & Class Diagram

<details>
<summary>Use Case Diagram</summary>
<img src="screenshots/Use_Case_Diagram.png" alt="Use Case Diagram" width="600" />
</details>
   
<details>
<summary>Class Diagram</summary>
<img src="screenshots/Class_Diagram.png" alt="Class Diagram" width="600" />
</details>

<br>


## Features
1. Doctor Registration and Profile Management:
- Doctors can register with a unique UserID, name, password, phone, and specialization.
- After logging in, doctors can update their phone number and specialization.
  
2. Doctor Schedule Management:

- Doctors can add, view, update, and delete their channelling schedules.
- Each schedule includes the doctor’s ID, channelling date, time, and the maximum number of patients allowed.
- The system ensures that a doctor can only have one channelling schedule per date.

3. Patient Registration and Profile Management:

- Patients can register with NIC, name, phone, and password.
- After logging in, patients can view and update their personal information.
- Patients cannot change their NIC.

4. Appointment Booking:

- Patients can view available channelling schedules and make appointments.
- Patients can only book one appointment per channelling schedule to avoid conflicts.
- Patients can view their confirmed appointments and cancel if necessary.

5. Navigation and User Interface:

- A consistent navigation bar is provided for ease of use, allowing access to various sections like appointment lists, personal appointments, user profiles, and logout.

<br>

### Database Structure
The database for the E-channeling System is designed to manage information for doctors, patients, channelling schedules, and appointments. It includes the following tables:

- Doctors Table: Stores information about doctors, including their userID, name, password, phone, and specialization.
- Patients Table: Contains patient details such as NIC, name, password, phone, and email.
- Channeling Schedule Table: Manages the scheduling of doctor appointments, including details like doctor ID, channelling date, time, maximum patients allowed, and the current number of patients.
- Appointments Table: Records the appointments made by patients, including channelling schedule ID, patient NIC, appointment date, appointment time, and status.

<details>
<summary>Database Structure</summary>
<img src="screenshots/Database_Structure.png" alt="Database Structure" width="800" />
</details>

#### Doctors Table

| Column       | Data Type     | Constraints      |
|--------------|---------------|------------------|
| userID       | VARCHAR(10)   | PRIMARY KEY      |
| name         | VARCHAR(100)  | NOT NULL         |
| password     | VARCHAR(100)  | NOT NULL         |
| phone        | VARCHAR(15)   | NOT NULL         |
| specialization | VARCHAR(100) | NOT NULL        |

#### Patients Table
| Column       | Data Type     | Constraints      |
|--------------|---------------|------------------|
| NIC          | VARCHAR(12)   | PRIMARY KEY      |
| name         | VARCHAR(100)  | NOT NULL         |
| password     | VARCHAR(100)  | NOT NULL         |
| phone        | VARCHAR(15)   | NOT NULL         |
| email        | VARCHAR(100)  | NOT NULL         |

#### Channeling Schedule Table
| Column         | Data Type   | Constraints      |
|----------------|-------------|------------------|
| id             | INT         | PRIMARY KEY      |
| doctor_id      | VARCHAR(10) | FOREIGN KEY      |
| channeling_date| DATE        | NOT NULL         |
| time           | TIME        | NOT NULL         |
| max_patients   | INT         | NOT NULL         |
| current_patients | INT       | NOT NULL         |

#### Appointments Table
| Column               | Data Type   | Constraints                     |
|----------------------|-------------|---------------------------------|
| channeling_schedule_id | INT       | FOREIGN KEY, COMPOSITE KEY      |
| patient_NIC          | VARCHAR(12) | FOREIGN KEY, COMPOSITE KEY      |
| appointment_date     | DATE        | NOT NULL                        |
| appointment_time     | TIME        | NOT NULL                        |
| status               | VARCHAR(20) | NOT NULL                        |

<br>


## Setup
### Initial Project Setup and Connecting Tomcat Server with NetBeans
<br>

1. Download and Install NetBeans:
- Download the latest version of NetBeans from the [official website.](https://netbeans.apache.org/front/main/download/)
- Follow the installation instructions provided.

2. Download and Install Apache Tomcat:
- Download Apache Tomcat from the [official website.](https://tomcat.apache.org/whichversion.html)
- Extract the downloaded ZIP file to a preferred location on your system.
  
3. Configure Apache Tomcat in NetBeans:
- Open NetBeans.
- Go to Tools > Servers.
- Click the "Add Server" in the Servers window.
- Choose Apache Tomcat and specify the location of your Tomcat installation.
- Complete the configuration by following the on-screen instructions.

<details>
<summary>Configure Apache Tomcat</summary>
  <div style="display: flex; justify-content: center;">
  <img src="screenshots/Servers_Window.png" alt="Configure Apache Tomcat" width="500" />
</div>
</details>

<br>



### Database Setup

<br>

To set up the database for the E-channeling System, follow these steps:

1. Download and Install XAMPP:
- Download XAMPP from the [official website.](https://www.apachefriends.org/download.html)
- Follow the installation instructions provided.

2. Start MySQL:
- Open XAMPP Control Panel.
- Start the MySQL service.

3. Create and Populate the Database:

- Open phpMyAdmin from the XAMPP Control Panel.
- Create a new database named "e_channeling_system".
<br>

Run the following SQL command to create the database:

<br>

``` SQL
CREATE DATABASE e_channeling_system;
```
  
- Run the following SQL queries to create and populate the tables:

Switch to the newly created database:
``` SQL
USE e_channeling_system;
```

Run the following SQL commands to create the necessary tables:

Create the Doctors Table
``` SQL
CREATE TABLE doctors (
    userID VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    specialization VARCHAR(100) NOT NULL
);
```
Create the Patients Table
``` SQL
CREATE TABLE patients (
    NIC VARCHAR(12) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);
```
Create the Channeling Schedule Table
``` SQL
CREATE TABLE channeling_schedule (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id VARCHAR(10),
    channeling_date DATE NOT NULL,
    time TIME NOT NULL,
    max_patients INT NOT NULL,
    current_patients INT NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES doctors(userID)
);
```
Create the Appointments Table
``` SQL
CREATE TABLE appointments (
    channeling_schedule_id INT,
    patient_NIC VARCHAR(12),
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    PRIMARY KEY (channeling_schedule_id, patient_NIC),
    FOREIGN KEY (channeling_schedule_id) REFERENCES channeling_schedule(id),
    FOREIGN KEY (patient_NIC) REFERENCES patients(NIC)
);
```

<br>

## Technologies and Tools 
- Java Servlets
- Java Server Pages (JSP)
- MySQL Database
- HTML/CSS for front-end design
- Apache Tomcat for server deployment
- XAMPP
- Apache NetBeans

<br>

## Contributions
Contributions to enhance the functionality and features of the e-channeling system are welcome. Please follow the standard GitHub workflow for submitting pull requests.

<br>

> [!NOTE]
> Ensure the MySQL JDBC driver (mysql-connector-java-...jar) is added to your project's "WEB-INF/lib" directory.
