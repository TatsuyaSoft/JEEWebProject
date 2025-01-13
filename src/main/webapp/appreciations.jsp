<!-- appreciations.jsp -->
<%@ page import="java.util.List" %>
<%@ page import="com.example.jeewebproject.Appreciation" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Livre d'Or - Appréciations</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

<header class="bg-teal-600 text-white shadow-lg">
    <div class="max-w-7xl mx-auto px-4 py-6 flex justify-between items-center">
        <h1 class="text-3xl font-bold">Livre d'Or</h1>
        <a href="index.jsp" class="px-4 py-2 bg-white text-teal-600 rounded-md hover:bg-teal-100">
            <i class="fas fa-home mr-2"></i> Retour Accueil
        </a>
    </div>
</header>

<main class="flex-grow">
    <div class="max-w-7xl mx-auto px-4 py-8">
        <h2 class="text-2xl font-semibold text-gray-900 mb-8">Liste des Appréciations</h2>

        <!-- Appreciation Grid -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
            <%
                List<Appreciation> appreciations = (List<Appreciation>) request.getAttribute("appreciations");
                if (appreciations != null && !appreciations.isEmpty()) {
                    for (Appreciation appreciation : appreciations) {
            %>
            <div class="bg-white p-6 rounded-lg shadow-xl border-l-4 border-teal-500 hover:shadow-2xl transition-all duration-200">
                <div class="flex justify-between items-start">
                    <div>
                        <h3 class="text-xl font-semibold text-teal-700">
                            <%= appreciation.getNom() %> <%= appreciation.getPrenom() %>
                        </h3>
                        <p class="text-sm text-gray-500 mt-1">
                            <i class="far fa-calendar-alt mr-1"></i><%= appreciation.getDate() %>
                        </p>
                    </div>
                    <div class="flex items-center space-x-2">
                        <a href="modifier.jsp?id=<%= appreciation.getId() %>" class="text-teal-600 hover:text-teal-800">
                            <i class="fas fa-edit"></i>
                        </a>
                        <button onclick="confirmerSuppression(<%= appreciation.getId() %>)" class="text-red-600 hover:text-red-800">
                            <i class="fas fa-trash"></i>
                        </button>
                    </div>
                </div>
                <p class="mt-4 text-gray-700">
                    <%= appreciation.getAppreciation() %>
                </p>
            </div>
            <%
                }
            } else {
            %>
            <p class="text-gray-500 col-span-full text-center">Aucune appréciation pour le moment.</p>
            <% } %>
        </div>
    </div>
</main>

<footer class="bg-teal-800 text-white py-6">
    <div class="max-w-7xl mx-auto px-4 text-center">
        <p>&copy; 2025 Livre d'Or. Tous droits réservés.</p>
    </div>
</footer>

<script>
    function confirmerSuppression(id) {
        if (confirm('Êtes-vous sûr de vouloir supprimer cette appréciation ?')) {
            window.location.href = 'appreciations?id=' + id;
        }
    }
</script>
</body>
</html>
