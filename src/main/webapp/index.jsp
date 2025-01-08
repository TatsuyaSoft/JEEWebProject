<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appreciation Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f9f9f9;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }

        input, textarea, select, button {
            width: 100%;
            padding: 8px;
            margin: 5px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<h1>Ajouter une Appréciation</h1>
<form id="appreciationForm">
    <label for="authorName">Nom de l'auteur :</label>
    <input type="text" id="authorName" name="authorName" placeholder="Entrez votre nom" required>

    <label for="appreciationText">Appréciation :</label>
    <textarea id="appreciationText" name="appreciationText" rows="4" placeholder="Écrivez votre appréciation ici..." required></textarea>

    <label for="rating">Évaluation :</label>
    <select id="rating" name="rating" required>
        <option value="" disabled selected>Choisissez une note</option>
        <option value="1">1 - Très mauvais</option>
        <option value="2">2 - Mauvais</option>
        <option value="3">3 - Moyen</option>
        <option value="4">4 - Bon</option>
        <option value="5">5 - Excellent</option>
    </select>

    <button type="submit">Soumettre</button>
</form>

<script>
    document.getElementById('appreciationForm').addEventListener('submit', function(event) {
        event.preventDefault();

        // Get form values
        const authorName = document.getElementById('authorName').value;
        const appreciationText = document.getElementById('appreciationText').value;
        const rating = document.getElementById('rating').value;

        // Display a confirmation message
        alert(`Merci, ${authorName}! Votre appréciation a été enregistrée.\n\nAppréciation : "${appreciationText}"\nNote : ${rating}/5`);

        // Optionally clear the form
        event.target.reset();
    });
</script>

</body>
</html>
