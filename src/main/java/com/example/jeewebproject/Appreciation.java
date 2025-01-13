package com.example.jeewebproject;

import java.util.Date;

public class Appreciation {
    private int id;
    private String nom;
    private String prenom;
    private String appreciation;
    private Date date; // Nouveau champ pour la date

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

    // Le setter pour la date n'est pas nécessaire car la date sera définie automatiquement
    public void setDate(Date date) {
        this.date = date;
    }

    // Méthode pour récupérer la date au format Date si nécessaire
    public void setCurrentDate() {
        this.date = new Date(); // Initialiser la date à la date courante
    }
}