<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil - Livre d'Or</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">

<div class="bg-white p-8 rounded-lg shadow-xl max-w-sm text-center">
    <h1 class="text-3xl font-bold text-gray-900 mb-6">Bienvenue dans le Livre d'Or</h1>

    <%
        // Check if the user is logged in
        Integer userId = (Integer) session.getAttribute("userId");
        String username = (String) session.getAttribute("username"); // Assume username is stored in session
        if (userId != null) {
    %>
    <!-- User is logged in -->
    <p class="text-gray-700 mb-4">Bienvenue, <span class="font-semibold text-teal-600"><%= username %></span>!</p>
    <div class="space-y-4">
        <a href="appreciations" class="block w-full px-4 py-2 bg-teal-600 text-white rounded-md hover:bg-teal-700 focus:outline-none focus:ring-2 focus:ring-teal-500 focus:ring-offset-2">
            Afficher Appréciations
        </a>
        <a href="nouvelleAppreciation.jsp" class="block w-full px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2">
            Ajouter Appréciation
        </a>
        <a href="logout.jsp" class="block w-full px-4 py-2 bg-red-600 text-white rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500 focus:ring-offset-2">
            Déconnexion
        </a>
    </div>
    <%
    } else {
    %>
    <!-- User is not logged in -->
    <p class="text-gray-700 mb-4">Veuillez vous connecter pour accéder au Livre d'Or.</p>
    <div class="space-y-4">
        <a href="login.jsp" class="block w-full px-4 py-2 bg-teal-600 text-white rounded-md hover:bg-teal-700 focus:outline-none focus:ring-2 focus:ring-teal-500 focus:ring-offset-2">
            Connexion
        </a>
        <a href="register.jsp" class="block w-full px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2">
            Inscription
        </a>
    </div>
    <%
        }
    %>
</div>

</body>
</html>
