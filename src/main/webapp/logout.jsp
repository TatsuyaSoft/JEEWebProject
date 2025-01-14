<!-- logout.jsp -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    // Invalidate the current session
    HttpSession Usersession = request.getSession(false); // Get the current session if it exists
    if (Usersession != null) {
        Usersession.invalidate(); // Invalidate the session to log out the user
    }

    // Redirect to the login page after logging out
    response.sendRedirect("login.jsp");
%>
