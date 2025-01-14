<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - Livre d'Or</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">

<div class="bg-white p-8 rounded-lg shadow-xl max-w-sm">
    <h1 class="text-3xl font-bold text-gray-900 mb-6">Connexion</h1>
    <form action="login.jsp" method="post" class="space-y-4">
        <input type="text" name="username" placeholder="Nom d'utilisateur" required
               class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500">
        <input type="password" name="password" placeholder="Mot de passe" required
               class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500">
        <button type="submit" class="w-full px-4 py-2 bg-teal-600 text-white rounded-md hover:bg-teal-700">
            Se connecter
        </button>
        <p class="text-sm text-gray-600 text-center">
            Pas encore de compte ? <a href="register.jsp" class="text-teal-600 hover:underline">Inscription</a>
        </p>
    </form>
</div>

<%
    // Handle login logic
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/appreciationdb", "root", "");
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("username", rs.getString("username"));
                response.sendRedirect("index.jsp");
            } else {
                System.out.println("<p class='text-red-500 mt-4'>Nom d'utilisateur ou mot de passe incorrect.</p>");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("<p class='text-red-500 mt-4'>Erreur lors de la connexion. Veuillez réessayer.</p>");
        }
    }
%>

</body>
</html>
