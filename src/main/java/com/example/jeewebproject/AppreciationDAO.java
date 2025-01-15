package com.example.jeewebproject;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppreciationDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/appreciationdb";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Save appreciation with user_id
    public void saveAppreciation(Appreciation appreciation) {
        String sql = "INSERT INTO appreciations (nom, prenom, appreciation, date, user_id) VALUES (?, ?, ?, ?, ?)";

        // Define the current date
        appreciation.setCurrentDate();

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, appreciation.getNom());
            statement.setString(2, appreciation.getPrenom());
            statement.setString(3, appreciation.getAppreciation());
            statement.setTimestamp(4, new Timestamp(appreciation.getDate().getTime())); // Convert date to Timestamp
            statement.setInt(5, appreciation.getUserId()); // Set user ID

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erreur lors de la sauvegarde de l'appréciation.", e);
        }
    }

    // Get all appreciations for a specific user
    public static List<Appreciation> getAppreciationsByUserId() {
        List<Appreciation> appreciations = new ArrayList<>();
        String sql = "SELECT * FROM appreciations";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {


            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Appreciation appreciation = new Appreciation();
                appreciation.setId(rs.getInt("id"));
                appreciation.setNom(rs.getString("nom"));
                appreciation.setPrenom(rs.getString("prenom"));
                appreciation.setAppreciation(rs.getString("appreciation"));
                appreciation.setDate(rs.getTimestamp("date"));
                appreciation.setUserId(rs.getInt("user_id"));
                appreciations.add(appreciation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appreciations;
    }

    // Get appreciation by ID
    public static Appreciation getAppreciationById(int id) {
        Appreciation appreciation = null;
        String sql = "SELECT * FROM appreciations WHERE id = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                appreciation = new Appreciation();
                appreciation.setId(resultSet.getInt("id"));
                appreciation.setNom(resultSet.getString("nom"));
                appreciation.setPrenom(resultSet.getString("prenom"));
                appreciation.setAppreciation(resultSet.getString("appreciation"));
                appreciation.setDate(resultSet.getTimestamp("date"));
                appreciation.setUserId(resultSet.getInt("user_id")); // Get user ID
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erreur lors de la récupération de l'appréciation.", e);
        }

        return appreciation;
    }

    // Delete appreciation only if it belongs to the user
    public void deleteAppreciation(int id, int userId) {
        String sql = "DELETE FROM appreciations WHERE id = ? AND user_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);
            statement.setInt(2, userId); // Ensure the user owns the appreciation
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erreur lors de la suppression de l'appréciation.", e);
        }
    }

    // Update appreciation only if it belongs to the user
    public void updateAppreciation(Appreciation appreciation) {
        String sql = "UPDATE appreciations SET nom = ?, prenom = ?, appreciation = ?, date = ? WHERE id = ? AND user_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, appreciation.getNom());
            statement.setString(2, appreciation.getPrenom());
            statement.setString(3, appreciation.getAppreciation());
            statement.setTimestamp(4, new Timestamp(appreciation.getDate().getTime()));
            statement.setInt(5, appreciation.getId());
            statement.setInt(6, appreciation.getUserId()); // Ensure the user owns the appreciation

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erreur lors de la mise à jour de l'appréciation.", e);
        }
    }
}
