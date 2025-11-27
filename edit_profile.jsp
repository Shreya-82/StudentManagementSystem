<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String user = (String) session.getAttribute("username");
    if(user == null) { response.sendRedirect("login.jsp"); return; }

    String msg = "";
    
    // 1. UPDATE LOGIC (Runs when form is submitted)
    if("POST".equalsIgnoreCase(request.getMethod())) {
        String newName = request.getParameter("fullname");
        String newEmail = request.getParameter("email");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_sms?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true", "root", "CSEAI20@Shreya");

            
            PreparedStatement ps = con.prepareStatement("UPDATE students SET fullname=?, email=? WHERE username=?");
            ps.setString(1, newName);
            ps.setString(2, newEmail);
            ps.setString(3, user);
            
            int i = ps.executeUpdate();
            if(i > 0) {
                session.setAttribute("fullname", newName); // Update session too
                msg = "Profile Updated Successfully!";
            }
        } catch(Exception e) { msg = "Error: " + e.getMessage(); }
    }
%>

<!DOCTYPE html>
<html>
<head><title>Edit Profile</title></head>
<body style="font-family: sans-serif; padding: 50px; text-align: center; background:#D9E6F2;">
    <h2>Edit Profile</h2>
    <p style="color: green; font-weight: bold;"><%= msg %></p>
    
    <form method="post" style="display:inline-block; text-align:left; border:1px solid #4A90E2; padding:20px; background:white; border-radius:5px;">
        <label>New Full Name:</label><br>
        <input type="text" name="fullname" required><br><br>
        
        <label>New Email:</label><br>
        <input type="email" name="email" required><br><br>
        
        <button type="submit" style="background:#4A90E2; color:white; padding:8px 20px; border:none;display:block; margin:10px auto;">Update Details</button>
    </form>
    <br><br>
    <a href="dashboard.jsp" style="color:#003399; font-weight:bold;">Cancel / Back</a>
</body>
</html>