<!-- index.jsp -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Livre d'Or - Nouvelle Appréciation</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

<%
  // Check if the user is authenticated
  HttpSession userSession = request.getSession(false); // Renamed to userSession to avoid conflict
  String username = (userSession != null) ? (String) userSession.getAttribute("username") : null;
  if (username == null) {
    // Redirect to login page if not authenticated
    response.sendRedirect("login.jsp");
    return;
  }
%>

<header class="bg-teal-600 text-white shadow-lg">
  <div class="max-w-7xl mx-auto px-4 py-6 flex items-center">
    <a href="appreciations" class="mr-4 text-white hover:underline">
      <i class="fas fa-arrow-left"></i>
    </a>
    <h1 class="text-3xl font-bold">Nouvelle Appréciation</h1>
  </div>
</header>

<main class="flex-grow">
  <div class="max-w-3xl mx-auto px-4 py-8">
    <form action="appreciations" method="POST" class="bg-white p-6 shadow-xl rounded-lg border-l-4 border-teal-500 space-y-6">
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
        <div>
          <label for="nom" class="block text-sm font-medium text-gray-700">Nom</label>
          <input type="text" id="nom" name="nom" required class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
        </div>
        <div>
          <label for="prenom" class="block text-sm font-medium text-gray-700">Prénom</label>
          <input type="text" id="prenom" name="prenom" required class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
        </div>
      </div>
      <div>
        <label for="appreciation" class="block text-sm font-medium text-gray-700">Votre appréciation</label>
        <textarea id="appreciation" name="appreciation" rows="5" required class="mt-1 block w-full border-gray-300 rounded-md shadow-sm"></textarea>
      </div>
      <div class="flex justify-end space-x-4">
        <a href="appreciations" class="px-4 py-2 bg-gray-100 text-gray-700 rounded-md hover:bg-gray-200">Annuler</a>
        <button type="submit" class="px-4 py-2 bg-teal-600 text-white rounded-md hover:bg-teal-700">Publier</button>
      </div>
    </form>
  </div>
</main>

<footer class="bg-teal-800 text-white py-6">
  <div class="max-w-7xl mx-auto px-4 text-center">
    <p>&copy; 2025 Livre d'Or. Tous droits réservés.</p>
  </div>
</footer>

</body>
</html>
