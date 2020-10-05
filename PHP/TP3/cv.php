<!DOCTYPE html>
<html lang="en-US">
    <head>
        <title>Basic HTML Template</title>
        <meta charset="UTF-8">
        <meta name="description" content="Template to build HTML5/CSS3 pages">
        <meta name="keywords" content="HTML, CSS, XML, JavaScript">
        <meta name="author" content="IUT de Lannion">
    </head>
    <body>

    <?php
        echo "<p>Nom : ". $_POST["nom"]."</p>";
        echo "<p>Prenom : ". $_POST["prenom"]."</p>";
        echo "<p>Email : ". $_POST["email"]."</p>";
        echo "<p>Date de naissance : ". $_POST["dateNaissance"]."</p>";
        echo "<p>Siteweb : ". $_POST["site"]."</p>";
        echo "<p>Numero de telephone : ". $_POST["phone"]."</p>";
        echo "<p>Nombre d'enfant : ". $_POST["nbEnfant"]."</p>";
        echo "<p>Couleur prefere : ". $_POST["color"]."</p>";
        echo "<p>Civilite : ". $_POST["gender"]."</p>";
    ?>

    </body>
</html>