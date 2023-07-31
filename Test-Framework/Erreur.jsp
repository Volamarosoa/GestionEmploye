<%
    String erreur = (String)request.getAttribute("erreur");
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
                        <h3 class="text-center" style="color: red;"><%= erreur %></h3>
                    </div>
                </div>
            </div>          
        </div>
    </div>

    <script src="./Bootstrap/Bootstrap/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
</body>
</html>