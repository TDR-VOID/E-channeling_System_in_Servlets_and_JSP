# E-channeling System in Servlets and JSP

## Overview
The E-channeling System is a web-based application developed using Java Servlets and JSP, aimed at facilitating the appointment booking process between doctors and patients. This system allows doctors to manage their channeling schedules and patients to book appointments, view their schedules, and manage their profiles. The system ensures data persistence by storing all information in a MySQL database.

## Requirements

### Functional Requirements

#### Doctor
1. **Registration**
   - Doctors should be able to register on the system by providing:
     - UserID
     - Name
     - Password
     - Phone
     - Specialization

2. **Login and Profile Management**
   - Doctors should be able to login with valid credentials (UserID, Password).
   - Doctors should be able to update their personal data (Phone, Specialization).

3. **Schedule Management**
   - Doctors can view all their schedules.
   - Doctors can add, update, or delete channeling schedules.
     - Each schedule must include:
       - Doctor’s ID
       - Channeling Date
       - Time
       - Number of patients per schedule
     - Only one channeling schedule per date is allowed.

#### Patient
1. **Registration**
   - Patients should be able to register on the system by providing:
     - NIC
     - Name
     - Phone
     - Password

2. **Login and Profile Management**
   - Patients should be able to login with valid credentials (NIC, Password).
   - Patients should be able to update their personal information.

3. **Appointment Booking**
   - Patients should be able to view available channeling schedules.
   - Patients should be able to make an appointment.
     - Each appointment should not exceed the patient count per channeling schedule.

### Non-Functional Requirements
1. **Data Persistence**
   - All data should be persistent and saved in a database.

2. **User Interfaces**
   - User interfaces should be created using Java Servlets or Java Server Pages (JSP).
