package models.employe;
import dao.annotations.Colonne;
import dao.annotations.Table;
import dao.generiqueDAO.GeneriqueDAO;

import etu2068.modelView.ModelView;
import etu2068.annotations.Url;
import etu2068.annotations.Argument;
import etu2068.annotations.Singleton;


import java.util.ArrayList;
import java.util.List;

@Singleton
@Table
public class Employe extends GeneriqueDAO{
    @Colonne
    String id;
    @Colonne
    String nom;
    @Colonne
    String prenom;
    
    public Employe() {}
    
    public Employe(String id) {
        this.setId(id);
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNom() {
        return this.nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return this.prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public void reinitialiser() {
        this.id = "";
        this.nom = "";
        this.prenom = "";
    }

    public Employe donneesUnEmploye() throws Exception {
        Employe Employe = new Employe();
        List<Employe> liste = (List<Employe>)this.list(null);
        if(liste.size() != 0) 
            Employe = liste.get(0);
        return Employe;
    }

}

