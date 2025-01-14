package com.example.jeewebproject;

import java.util.Date;

public class Appreciation {
    private int id;
    private String nom;
    private String prenom;
    private String appreciation;
    private Date date; // Nouveau champ pour la date
    private int userId; // Nouveau champ pour l'ID de l'utilisateur

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getAppreciation() {
        return appreciation;
    }

    public void setAppreciation(String appreciation) {
        this.appreciation = appreciation;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setCurrentDate() {
        this.date = new Date(); // Initialiser la date à la date courante
    }

    // Getter pour userId
    public int getUserId() {
        return userId;
    }

    // Setter pour userId
    public void setUserId(int userId) {
        this.userId = userId;
    }
}
