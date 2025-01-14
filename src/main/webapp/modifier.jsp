<!-- modifier.jsp -->
<%@ page import="com.example.jeewebproject.Appreciation" %>
<%@ page import="com.example.jeewebproject.AppreciationDAO" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Livre d'Or - Modifier l'appréciation</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

<%
    // Check if the user is authenticated
    HttpSession Usersession = request.getSession(false);
    String username = (Usersession != null) ? (String) Usersession.getAttribute("username") : null;
    if (username == null) {
        // Redirect to login page if not authenticated
        response.sendRedirect("login.jsp");
        return;
    }
%>

<header class="bg-teal-600 text-white shadow-lg">
    <div class="max-w-7xl mx-auto px-4 py-6">
        <div class="flex items-center gap-4">
            <a href="appreciations" class="text-white hover:underline">
                <i class="fas fa-arrow-left"></i>
            </a>
            <h1 class="text-3xl font-bold">Modifier l'appréciation</h1>
        </div>
    </div>
</header>

<main class="max-w-3xl mx-auto px-4 py-8">
    <%
        String idString = request.getParameter("id");
        if (idString != null) {
            try {
                int id = Integer.parseInt(idString);
                AppreciationDAO dao = new AppreciationDAO();
                Appreciation appreciation = dao.getAppreciationById(id);

                if (appreciation != null) {
    %>
    <div class="bg-white rounded-lg shadow-xl border-l-4 border-teal-500 p-8">
        <form action="appreciations" method="post" class="space-y-6">
            <input type="hidden" name="id" value="<%= appreciation.getId() %>">

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Nom Field -->
                <div>
                    <label for="nom" class="block text-sm font-medium text-gray-700">Nom</label>
                    <input type="text" id="nom" name="nom" value="<%= appreciation.getNom() %>" required
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-teal-500 focus:ring-teal-500">
                </div>

                <!-- Prénom Field -->
                <div>
                    <label for="prenom" class="block text-sm font-medium text-gray-700">Prénom</label>
                    <input type="text" id="prenom" name="prenom" value="<%= appreciation.getPrenom() %>" required
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-teal-500 focus:ring-teal-500">
                </div>
            </div>

            <!-- Appréciation Field -->
            <div>
                <label for="appreciation" class="block text-sm font-medium text-gray-700">Votre appréciation</label>
                <textarea id="appreciation" name="appreciation" rows="5" required
                          class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-teal-500 focus:ring-teal-500"><%= appreciation.getAppreciation() %></textarea>
            </div>

            <!-- Action Buttons -->
            <div class="flex justify-end gap-4">
                <a href="appreciations"
                   class="px-4 py-2 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50">
                    Annuler
                </a>
                <button type="submit"
                        class="px-4 py-2 bg-teal-600 text-white rounded-md hover:bg-teal-700 focus:outline-none focus:ring-2 focus:ring-teal-500 focus:ring-offset-2">
                    Enregistrer les modifications
                </button>
            </div>
        </form>
    </div>
    <%
    } else {
    %>
    <div class="bg-red-50 border border-red-200 rounded-lg p-4 text-red-700">
        L'appréciation demandée n'existe pas.
    </div>
    <%
        }
    } catch (NumberFormatException e) {
    %>
    <div class="bg-red-50 border border-red-200 rounded-lg p-4 text-red-700">
        ID non valide.
    </div>
    <%
        }
    } else {
    %>
    <div class="bg-red-50 border border-red-200 rounded-lg p-4 text-red-700">
        Aucun ID fourni.
    </div>
    <%
        }
    %>
</main>

</body>
</html>
