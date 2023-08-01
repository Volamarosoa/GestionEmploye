package main;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import models.dejeuner.Dejeuner;

public class WriteXMLFile {
    public static void main(String[] args) throws Exception{
        // Créer un document XML avec un élément racine
        Element racine = new Element("platXML");
        Document document = new Document(racine);
        Dejeuner dejeuner = new Dejeuner();

        
        // Écrire le document XML dans un fichier
        try {
            dejeuner.exportXML();
            // List<Dejeuner> listeDejeuner = (List<Dejeuner>)new Dejeuner().list(null);

            // for (models.dejeuner.Dejeuner dejeuner : listeDejeuner) {
            //     // Ajouter des éléments et des attributs au document XML
            //     Element personne1 = new Element("platXML");
            //     personne1.setAttribute("id", "" + dejeuner.getId());
            //     personne1.addContent(new Element("date").setText(dejeuner.getDate().toString()));
            //     personne1.addContent(new Element("nom").setText(dejeuner.getEmploye().getNom()));
            //     personne1.addContent(new Element("plat").setText(dejeuner.getPlat().getPlat()));
            //     racine.addContent(personne1);    
            // }
            
            
            // XMLOutputter outputter = new XMLOutputter(Format.getPrettyFormat());
            // FileWriter writer = new FileWriter("../../fichier.xml");
            // outputter.output(document, writer);
            // writer.close();
            // System.out.println("Le fichier XML a été créé avec succès.");
        } catch (IOException e) {
            System.err.println(e.getMessage());
        }
    }
}
