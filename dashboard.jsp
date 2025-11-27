<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body { font-family: sans-serif; padding: 50px; background-color: #D9E6F2; }
        .card { background: #F5F8FB; padding: 30px; border-radius: 8px; max-width: 600px; margin: auto; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        .btn { display: block; width: 100%; padding: 12px; margin: 10px 0; text-align: center; text-decoration: none; color: white; border-radius: 5px; }
        .blue { background: #4A90E2; }
        .green { background: #4A90E2; }
        .orange { background: #4A90E2; }
        .red { background: #4A90E2; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Welcome, <%= session.getAttribute("fullname") %>!</h1>
        <p>Student Dashboard</p>
        <hr>
        
        <a href="profile.jsp" class="btn blue">My Profile</a>
        <a href="class_list.jsp" class="btn green">View Classmates</a>
        <a href="edit_profile.jsp" class="btn orange">Edit Details</a>
        <a href="logout.jsp" class="btn red">Logout</a>
    </div>
</body>
</html>