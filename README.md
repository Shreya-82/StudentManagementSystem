Student Management System (SMS)
A web-based Student Management System built using JSP (Java Server Pages), JDBC, and MySQL. This project allows students to register, log in, manage their profiles, and view classmates. It is designed to run directly on the Apache Tomcat Server.

🚀 Features
User Registration: Create a new student account.

Secure Login: Session-based authentication.

Dashboard: Central hub for student actions.

Profile Management: View personal details.

Edit Profile: Update name and email address.

Classmate View: View a list of other registered students.

Logout: Secure session termination.

🛠️ Technologies Used
Frontend: HTML, CSS

Backend: Java Server Pages (JSP)

Database: MySQL

Server: Apache Tomcat (v9.0 or later)

Connectivity: JDBC (MySQL Connector)

📂 Project Structure
To run this project, the folder structure inside your Tomcat directory must look exactly like this:

Plaintext

Apache Tomcat/
└── webapps/
    └── student_sms/
        ├── index.jsp          (Home Page)
        ├── login.jsp          (Login Page)
        ├── register.jsp       (Registration Page)
        ├── dashboard.jsp      (Main Dashboard)
        ├── profile.jsp        (View Profile)
        ├── edit_profile.jsp   (Update Profile)
        ├── class_list.jsp     (View All Students)
        ├── logout.jsp         (Logout Logic)
        └── WEB-INF/
            └── lib/
                └── mysql-connector-j-8.x.x.jar  <-- (CRITICAL: Database Driver)
⚙️ Database Setup
Before running the project, you must create the database and table in MySQL.

Open MySQL Command Line or Workbench.

Run the following SQL commands:

SQL

-- 1. Create the Database
CREATE DATABASE student_sms;

-- 2. Select the Database
USE student_sms;

-- 3. Create the Table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    fullname VARCHAR(100),
    email VARCHAR(100)
);

📝 Configuration
Important: If your MySQL password is not root, you must update the database connection code in the JSP files.

Open register.jsp, login.jsp, profile.jsp, edit_profile.jsp, and class_list.jsp. Find this line:

Java

DriverManager.getConnection("jdbc:mysql://localhost:3306/student_sms", "root", "root");
Change the last "root" to your actual MySQL password.

▶️ How to Run
Start Tomcat: Go to your Tomcat bin folder and double-click startup.bat.

Open Browser: Open Chrome or Edge.

Visit URL: > [http://localhost:8080/student_sms/](http://localhost:8089/student_sms/index.jsp)

⚠️ Troubleshooting
Error: "Class not found com.mysql.cj.jdbc.Driver"

Solution: You forgot to put the mysql-connector.jar file inside the WEB-INF/lib folder.

Error: "404 Not Found"

Solution: Check if your file is named login.jsp.txt instead of login.jsp. Enable "File name extensions" in Windows View settings to check.

Error: "Access Denied for user root"

Solution: Your database password in the code is wrong. Update it in the JSP files.
