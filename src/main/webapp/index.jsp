<!-- index.jsp -->
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
    <div class="space-y-4">
        <a href="appreciations" class="block w-full px-4 py-2 bg-teal-600 text-white rounded-md hover:bg-teal-700 focus:outline-none focus:ring-2 focus:ring-teal-500 focus:ring-offset-2">
            Afficher Appréciations
        </a>
        <a href="nouvelleAppreciation.jsp" class="block w-full px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2">
            Ajouter Appréciation
        </a>
    </div>
</div>

</body>S
</html>
