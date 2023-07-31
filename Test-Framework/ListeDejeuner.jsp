<%@page import="models.dejeuner.Dejeuner, java.util.List, models.plat.Plat, models.employe.Employe" %>
<%
    List<Dejeuner> liste = (List<Dejeuner>)request.getAttribute("liste");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Bootstrap/Bootstrap/bootstrap-3.3.6-dist/css/bootstrap.min.css">
    <title>Liste Trajet</title>
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
            </div>
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <h3 class="text-center">Liste des Dejeuner</h3>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Date</th>
                                <th>Employe</th>
                                <th>Plat</th>
                            </tr>
                            </thead>
                            <tbody>
            
                            <% for(int j=0; j<liste.size(); j++) { %>
                            <tr>
                                <td><%= liste.get(j).getDate().toString() %></td> 
                                <td><%= liste.get(j).getEmploye().getPrenom() %> <%= liste.get(j).getEmploye().getNom() %></td>
                                <td><%= liste.get(j).getPlat().getPlat() %></td>
                            </tr>

                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div> 
            <div class="col-md-4 panel-body">
                <section class="contact-clean">
                    <h3 class="text-center">Telecharger le dernier fichier</h3>
                    <br>
                    <div id = "telecharger" style="display: none;">

                    </div>
                    <button type="button" class="btn btn-default" onclick="telecharger()">Telecharger</button>
                </section>
            </div>    
            <button type="button" class="btn btn-default">Telecharger XML</button>
        </div>
    </div>

<script src="../Bootstrap/Bootstrap/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    function telecharger() {
        $.ajax({
            url: "../Dejeuner/telecharger.do",
            method: "GET",
            dataType: "json",
            success: function(data) {
                // Traitez les données JSON ici (stockées dans 'data')
                console.log("ojeyy");
                console.log("donnee: " + data["data"]["fichier"]);
                var donnees = data["data"]["fichier"];
                var divDate = document.getElementById("telecharger");
                divDate.style.display = "block";
                divDate.textContent = "";
                for(var i=0; i<donnees.length; i++) {
                    divDate.textContent += "*" + donnees[i];
                }

            },
            error: function(xhr, status, error) {
                console.error("Erreur AJAX:", status, error);
            }
        });
    }
</script>
</body>
</html>