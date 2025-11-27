<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String msg = request.getParameter("msg");
    if(msg != null && msg.equals("registered")) msg = "Registration Successful! Please Login.";
    
    if("POST".equalsIgnoreCase(request.getMethod())) {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_sms?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true", "root", "CSEAI20@Shreya");
            // CHANGE "root", "root" TO YOUR DB CREDENTIALS

            PreparedStatement ps = con.prepareStatement("SELECT * FROM students WHERE username=? AND password=?");
            ps.setString(1, user);
            ps.setString(2, pass);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("fullname", rs.getString("fullname"));
                response.sendRedirect("dashboard.jsp");
            } else {
                msg = "Invalid Username or Password";
            }
        } catch(Exception e) {
            msg = "Error: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>
<head><title>Login</title></head>
<body style="font-family: sans-serif; text-align: center; padding-top: 50px; background-color: #D9E6F2">
    <h2>Student Login</h2>
    
    <% if(msg != null) { %> <p style="color:#003399;"><%= msg %></p> <% } %>

    <form method="post">
        <input type="text" name="username" placeholder="Username" required><br><br>
        <input type="password" name="password" placeholder="Password" required><br><br>
        <button type="submit" style="background:#4A90E2; color:white; padding:8px 20px; border:none;" >Login</button>
    </form>
    <br>
    <a href="register.jsp" style="color:#003399;">Register New Account</a>
</body>
</html>