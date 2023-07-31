package models.dejeuner;
import dao.annotations.Colonne;
import dao.annotations.Table;
import dao.generiqueDAO.GeneriqueDAO;

import etu2068.modelView.ModelView;
import etu2068.annotations.Url;
import etu2068.annotations.Argument;
import etu2068.annotations.Singleton;
import etu2068.annotations.restAPI;
import etu2068.annotations.Auth;
import etu2068.annotations.Test;  
// import etu2068.annotations.ToXml;
// import etu2068.annotations.ExportXML;
import etu2068.fileUpload.FileUpload;



import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import java.io.FileWriter;
import java.io.IOException;

import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;
import java.nio.charset.StandardCharsets;

import models.employe.Employe;
import models.plat.Plat;


@Singleton
@Table
public class Dejeuner extends GeneriqueDAO{
    @Colonne
    int id = -1;
    @Colonne
    String idEmploye;
    @Colonne
    String idPlat;
    @Colonne
    Timestamp date;
    FileUpload fichier;

    public Dejeuner() {}

    public Dejeuner(int id) {
        this.setId(id);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdEmploye() {
        return idEmploye;
    }

    public void setIdEmploye(String idEmploye) {
        this.idEmploye = idEmploye;
    }

    public String getIdPlat() {
        return idPlat;
    }

    public void setIdPlat(String idPlat) {
        this.idPlat = idPlat;
    }

    public Timestamp getDate() {
        return this.date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public FileUpload getFichier() {
        return fichier;
    }

    public void setFichier(byte[] fichier) {
        System.out.println("nitesty");
        this.fichier = new FileUpload(fichier);
        System.out.println(this.getFichier());
    }

    public void reinitialiser() {
        this.id = -1;
        this.idEmploye = "";
        this.idPlat = "";
        this.date = null;
    }

    @Url(name = "/inserer")
    public ModelView inserer() throws Exception {
        ModelView view = new ModelView("insertion_Dejeuner.jsp");
        view.addItem("listeEmploye", (List<Employe>)new Employe().list(null));
        view.addItem("listePlat", (List<Plat>)new Plat().list(null));
        return view;
    }

    @Auth()
    @Url(name = "/save")
    public ModelView save() throws Exception {
        this.insert(null);
        ModelView view = new ModelView("insertion_Dejeuner.jsp");
        view.addItem("listeEmploye", (List<Employe>)new Employe().list(null));
        view.addItem("listePlat", (List<Plat>)new Plat().list(null));
        return view;
    }

    public Employe getEmploye() throws Exception {
        Employe Employe = new Employe(this.getIdEmploye()).donneesUnEmploye();
        System.out.println(Employe);
        return Employe;
    }

    public Plat getPlat() throws Exception {
        Plat Plat = new Plat(this.getIdPlat()).donneesUnPlat();
        return Plat;
    }

    @Url(name = "/ListeDejeuner")
    public ModelView ListeDejeuner() throws Exception {
        ModelView view = new ModelView("ListeDejeuner.jsp");
        System.out.println("okeyy");
        List<Dejeuner> listeDejeuner = (List<Dejeuner>)new Dejeuner().list(null);
        System.out.println("taille: " + listeDejeuner.size());
        view.addItem("liste", listeDejeuner);
        return view;
    }

    @Url(name = "/identifier")
    public ModelView identifier() throws Exception {
        ModelView view = new ModelView("page.jsp");
        view.addSession("isConnected", true);
        System.out.println("s'identifier = true");
        return view;
    }

    @Url(name = "/deconnecter")
    public ModelView deconnecter() throws Exception {
        ModelView view = new ModelView("page.jsp");
        view.addSession("isConnected", false);
        System.out.println("s'identifier = false");
        return view;
    }

    @Auth()
    @Url(name = "/uploadFichier")
    public ModelView uploadFichier() throws Exception {
        ModelView view = new ModelView("insertion_Dejeuner.jsp");
        view.addItem("listeEmploye", (List<Employe>)new Employe().list(null));
        view.addItem("listePlat", (List<Plat>)new Plat().list(null));
        return view;
    }

    @restAPI()
    @Url(name = "/telecharger")
    public ModelView telecharger() throws Exception {
        String str = new String(this.getFichier().getBytes(), StandardCharsets.UTF_8);
        String[] lignes = str.split("\n");
        for (String string : lignes) {
            System.out.println(string);
        }
        ModelView view = new ModelView("ListeTrajet.jsp");
        view.addItem("fichier", lignes);
        return view;
    }


    @Url(name = "/telechargerxml")
    public String exportXML() throws Exception {
        Element racine = new Element("platXML");
        Document document = new Document(racine);
        String nom = "fichier.xml";
        
        // Écrire le document XML dans un fichier
        try {
            List<Dejeuner> listeDejeuner = (List<Dejeuner>)new Dejeuner().list(null);

            for (models.dejeuner.Dejeuner dejeuner : listeDejeuner) {
                // Ajouter des éléments et des attributs au document XML
                Element personne1 = new Element("platXML");
                personne1.setAttribute("id", "" + dejeuner.getId());
                personne1.addContent(new Element("date").setText(dejeuner.getDate().toString()));
                personne1.addContent(new Element("nom").setText(dejeuner.getEmploye().getNom()));
                personne1.addContent(new Element("plat").setText(dejeuner.getPlat().getPlat()));
                racine.addContent(personne1);    
            }
            
            
            XMLOutputter outputter = new XMLOutputter(Format.getPrettyFormat());
            FileWriter writer = new FileWriter("../../fichier.xml");
            outputter.output(document, writer);
            writer.close();
            System.out.println("Le fichier XML a été créé avec succès.");
        } catch (IOException e) {
            System.err.println("Une erreur s'est produite lors de l'écriture dans le fichier XML : " + e.getMessage());
        }
        return nom;
    }
    
}
