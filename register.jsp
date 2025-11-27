<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // JAVA LOGIC TO HANDLE REGISTRATION
    String msg = "";
    if("POST".equalsIgnoreCase(request.getMethod())) {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String name = request.getParameter("fullname");
        String mail = request.getParameter("email");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_sms?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true", "root", "CSEAI20@Shreya"); 
            // CHANGE "root", "root" TO YOUR DATABASE USER/PASS

            PreparedStatement ps = con.prepareStatement("INSERT INTO students (username, password, fullname, email) VALUES (?,?,?,?)");
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, name);
            ps.setString(4, mail);
            
            int i = ps.executeUpdate();
            if(i > 0) {
                response.sendRedirect("login.jsp?msg=registered");
            }
        } catch(Exception e) {
            msg = "Error: " + e.getMessage();
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>
<head><title>Register</title></head>
<body style="font-family: sans-serif; text-align: center; padding-top: 50px;  background:#D9E6F2;">
    <h2>Student Registration</h2>
    <p style="color:red"><%= msg %></p>
    
    <form method="post">
        <input type="text" name="username" placeholder="Username" required><br><br>
        <input type="password" name="password" placeholder="Password" required><br><br>
        <input type="text" name="fullname" placeholder="Full Name" required><br><br>
        <input type="email" name="email" placeholder="Email" required><br><br>
        <button type="submit" style="background:#4A90E2; color:white; padding:8px 20px; border:none;">Register</button>
    </form>
    <br>
    <a href="login.jsp" style="color:#003399;">Go to Login</a>
</body>
</html>