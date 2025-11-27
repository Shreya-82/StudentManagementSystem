<%
    session.invalidate(); // Kill session
    response.sendRedirect("login.jsp");
%>