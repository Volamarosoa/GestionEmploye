<%@page import="models.dejeuner.Dejeuner, java.util.List, models.plat.Plat, models.employe.Employe" %>
<%
    List<Plat> listePlat = (List<Plat>)request.getAttribute("listePlat");
    List<Employe> listeEmploye = (List<Employe>)request.getAttribute("listeEmploye");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Bootstrap/Bootstrap/bootstrap-3.3.6-dist/css/bootstrap.min.css">
    <title>Insertion</title>
    <style>
        th, td, .lis li{
            color: black !important;
        }
        a{
            text-decoration: none !important;
        }
        .custom-file-input {
            display: inline-block;
            padding: 6px 12px;
            cursor: pointer;
            background-color: #e9ecef;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }

        .custom-file-input::before {
            content: 'Choisir un fichier';
        }

        .custom-file-input:hover::before {
            background-color: #d1d1d1;
        }

        .custom-file-input:active {
            background-color: #ccc;
        }

        /* Cacher le champ d'import de fichier par défaut */
        input[type="file"] {
            display: none;
        }


    </style>
</head>

<body>
    <div class="container">
        <div class="row">
          <br>
            <div class="col container">
                <ul class="nav nav-pills lis">
                    <li role="presentation" ><a href="../Dejeuner/inserer.do">Insertion Dejeuner</a></li>
                    <li role="presentation" ><a href="../Dejeuner/ListeDejeuner.do">Liste des Dejeuner</a></li>
                    <li role="presentation" ><a href="../Dejeuner/identifier.do">S'identifier</a></li>
                    <li role="presentation" ><a href="../Dejeuner/deconnecter.do">Se deconnecter</a></li>
                </ul>
                <div class="col-md-4 panel-body">
                    <section class="contact-clean">
                        <form action="../Dejeuner/save.do" method="post">
                            <h3 class="text-center">Inserer Dejeuner</h3>
                            <br>
                            <div class="form-group">
                                <label>Date</label>
                                <input class="form-control" type="datetime-local"  name="date">
                            </div>
                            <div class="form-group">
                                <label>Employe</label>
                                <select class="form-control form-control-sm" name="idEmploye" required>
                                    <optgroup label="Liste des Employes">
                                        <% for (int i = 0; i < listeEmploye.size(); i++) { %>
                                        <option value="<%= listeEmploye.get(i).getId() %>"><%= listeEmploye.get(i).getPrenom() %> <%= listeEmploye.get(i).getNom() %></option>
                                        <% } %>
                                    </optgroup>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Plat</label>
                                <select class="form-control form-control-sm" name="idPlat" required>
                                    <optgroup label="Liste des Plats">
                                        <% for (int i = 0; i < listePlat.size(); i++) { %>
                                        <option value="<%= listePlat.get(i).getId() %>"><%= listePlat.get(i).getPlat() %></option>
                                        <% } %>
                                    </optgroup>
                                </select>
                            </div>
                            <div
                             class="form-group">
                                <button class="btn btn-primary" type="submit">Ajouter</button>
                            </div>
    
                        </form>
                    </section>
                </div>
                <div class="col-md-4 panel-body">
                    <section class="contact-clean">
                        <form action="../Dejeuner/uploadFichier.do" method="post"  enctype="multipart/form-data">
                            <h3 class="text-center">Upload</h3>
                            <br>
                            <p>
                                <label class="custom-file-input"><input type="file" name="fichier"  onchange="updateFileName(this)" required></label>
                                <span id="file-name-display">Aucun fichier selectionne</span>
                            </p>
                            <button type="submit" class="btn btn-default">Telecharger</button>
                        </form>
                    </section>
                </div>
            </div>            
        </div>
    </div>

    <script src="../Bootstrap/Bootstrap/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
<script>
    function updateFileName(input) {
        const fileNameDisplay = document.getElementById('file-name-display');
        if (input.files.length > 0) {
            fileNameDisplay.textContent = input.files[0].name;
            console.log("misy " + fileNameDisplay.textContent);
        } else {
            console.log("tsisy");
            fileNameDisplay.textContent = ' fichier sélectionné';
        }
    }
</script>
</body>
</html>