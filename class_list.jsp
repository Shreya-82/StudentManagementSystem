<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("username") == null) { response.sendRedirect("login.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head><title>Class List</title></head>
<body style="font-family: sans-serif; padding: 50px; text-align: center; background:#D9E6F2;">
    <h2>Classmates List</h2>
    <table border="1" cellpadding="10" style="margin:auto; border-collapse:collapse; width:60%; background:white;">
        <tr style="background:#4A90E2; color:white;">
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
        </tr>
        
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_sms?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true", "root", "CSEAI20@Shreya");

                
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM students");
                
                while(rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("fullname") %></td>
                <td><%= rs.getString("email") %></td>
            </tr>
        <%
                }
            } catch(Exception e) { out.println(e); }
        %>
    </table>
    <br>
    <a href="dashboard.jsp" style="color:#003399; font-weight:bold;">Back to Dashboard</a>
</body>
</html>