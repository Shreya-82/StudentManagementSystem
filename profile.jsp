<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String user = (String) session.getAttribute("username");
    if(user == null) { response.sendRedirect("login.jsp"); return; }
    
    String dbName = "", dbEmail = "";
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_sms?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true", "root", "CSEAI20@Shreya");

        
        PreparedStatement ps = con.prepareStatement("SELECT * FROM students WHERE username=?");
        ps.setString(1, user);
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()) {
            dbName = rs.getString("fullname");
            dbEmail = rs.getString("email");
        }
    } catch(Exception e) { e.printStackTrace(); }
%>
<!DOCTYPE html>
<html>
<head><title>My Profile</title></head>
<body style="font-family: sans-serif; padding: 50px; text-align: center; background:#D9E6F2;">
    <h2>My Profile</h2>
    <table border="1" cellpadding="10" style="margin:auto; border-collapse:collapse; width:50%; background:white;">
        <tr style="background:#4A90E2; color:white;">
            <th>Username</th>
            <td><%= user %></td>
        </tr>
        <tr>
            <th>Full Name</th>
            <td><%= dbName %></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><%= dbEmail %></td>
        </tr>
    </table>
    <br>
    <a href="dashboard.jsp" style="color:#003399; font-weight:bold;">Back to Dashboard</a>
</body>
</html>