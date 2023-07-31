package models.plat;
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
public class Plat extends GeneriqueDAO{
    @Colonne
    String id;
    @Colonne
    String plat;

    public Plat() {}

    public Plat(String id) {
        this.setId(id);
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPlat() {
        return this.plat;
    }

    public void setPlat(String plat) {
        this.plat = plat;
    }

    public void reinitialiser() {
        this.id = "";
        this.plat = "";
    }

    public Plat donneesUnPlat() throws Exception {
        Plat Plat = new Plat();
        List<Plat> liste = (List<Plat>)this.list(null);
        if(liste.size() != 0) 
            Plat = liste.get(0);
        return Plat;
    }

}

