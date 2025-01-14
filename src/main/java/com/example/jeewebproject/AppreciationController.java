package com.example.jeewebproject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/appreciations")
public class AppreciationController extends HttpServlet {
    private final AppreciationDAO dao = new AppreciationDAO();

    // Méthode pour gérer la soumission d'un formulaire d'appréciation
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp"); // Rediriger vers la page de connexion si l'utilisateur n'est pas authentifié
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String idString = request.getParameter("id");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String appreciation = request.getParameter("appreciation");

        // Si un ID est présent, on modifie une appréciation existante
        if (idString != null && !idString.isEmpty()) {
            int id = Integer.parseInt(idString);
            Appreciation existingAppreciation = dao.getAppreciationById(id);

            // Vérifier que l'appréciation appartient à l'utilisateur connecté
            if (existingAppreciation != null && existingAppreciation.getUserId() == userId) {
                existingAppreciation.setNom(nom);
                existingAppreciation.setPrenom(prenom);
                existingAppreciation.setAppreciation(appreciation);
                existingAppreciation.setCurrentDate(); // Définir la date actuelle

                dao.updateAppreciation(existingAppreciation); // Mise à jour de l'appréciation
            } else {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Vous n'êtes pas autorisé à modifier cette appréciation.");
                return;
            }
        } else {
            // Sinon, on ajoute une nouvelle appréciation
            Appreciation newAppreciation = new Appreciation();
            newAppreciation.setNom(nom);
            newAppreciation.setPrenom(prenom);
            newAppreciation.setAppreciation(appreciation);
            newAppreciation.setCurrentDate(); // Définir la date actuelle
            newAppreciation.setUserId(userId); // Associer l'utilisateur connecté

            dao.saveAppreciation(newAppreciation); // Sauvegarde de l'appréciation
        }

        response.sendRedirect("appreciations"); // Redirige vers la page des appréciations après la soumission
    }

    // Méthode pour gérer la récupération des appréciations et suppression
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp"); // Rediriger vers la page de connexion si l'utilisateur n'est pas authentifié
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String deleteId = request.getParameter("id");

        // Suppression d'une appréciation si l'ID est fourni dans la requête
        if (deleteId != null) {
            try {
                int id = Integer.parseInt(deleteId);
                Appreciation appreciationToDelete = dao.getAppreciationById(id);

                // Vérifier que l'appréciation appartient à l'utilisateur connecté
                if (appreciationToDelete != null && appreciationToDelete.getUserId() == userId) {
                    dao.deleteAppreciation(id,userId); // Suppression de l'appréciation par son ID
                } else {
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "Vous n'êtes pas autorisé à supprimer cette appréciation.");
                    return;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // Récupération des appréciations de l'utilisateur connecté
        List<Appreciation> userAppreciations = dao.getAppreciationsByUserId(userId);

        // Passer la liste d'appréciations à la vue JSP
        request.setAttribute("appreciations", userAppreciations);
        request.getRequestDispatcher("appreciations.jsp").forward(request, response);
    }
}
