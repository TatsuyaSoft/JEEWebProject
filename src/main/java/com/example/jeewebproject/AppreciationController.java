package com.example.jeewebproject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.jeewebproject.AppreciationDAO;
import com.example.jeewebproject.Appreciation;
import java.io.IOException;
import java.util.List;

@WebServlet("/appreciations")
public class AppreciationController extends HttpServlet {
    private final AppreciationDAO dao = new AppreciationDAO();

    // Méthode pour gérer la soumission d'un formulaire d'appréciation
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idString = request.getParameter("id");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String appreciation = request.getParameter("appreciation");

        // Si un ID est présent, on modifie une appréciation existante
        if (idString != null && !idString.isEmpty()) {
            int id = Integer.parseInt(idString);
            Appreciation appreciationToUpdate = new Appreciation();
            appreciationToUpdate.setId(id);
            appreciationToUpdate.setNom(nom);
            appreciationToUpdate.setPrenom(prenom);
            appreciationToUpdate.setAppreciation(appreciation);
            appreciationToUpdate.setCurrentDate(); // Définir la date actuelle

            dao.updateAppreciation(appreciationToUpdate); // Mise à jour de l'appréciation
        } else {
            // Sinon, on ajoute une nouvelle appréciation
            Appreciation newAppreciation = new Appreciation();
            newAppreciation.setNom(nom);
            newAppreciation.setPrenom(prenom);
            newAppreciation.setAppreciation(appreciation);
            newAppreciation.setCurrentDate(); // Définir la date actuelle

            dao.saveAppreciation(newAppreciation); // Sauvegarde de l'appréciation
        }

        response.sendRedirect("appreciations"); // Redirige vers la page des appréciations après la soumission
    }

    // Méthode pour gérer la récupération des appréciations et suppression
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Suppression d'une appréciation si l'ID est fourni dans la requête
        String deleteId = request.getParameter("id");
        if (deleteId != null) {
            try {
                int id = Integer.parseInt(deleteId);
                dao.deleteAppreciation(id); // Suppression de l'appréciation par son ID
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // Récupération de toutes les appréciations
        List<Appreciation> appreciations = dao.getAllAppreciations();

        // Passer la liste d'appréciations à la vue JSP
        request.setAttribute("appreciations", appreciations);
        request.getRequestDispatcher("appreciations.jsp").forward(request, response);
    }

    // Méthode pour récupérer une appréciation spécifique par son ID
    public Appreciation getAppreciationById(int id) {
        return dao.getAppreciationById(id);
    }

    // Méthode pour mettre à jour une appréciation dans la base de données
    public void updateAppreciation(Appreciation appreciation) {
        dao.updateAppreciation(appreciation);
    }
}