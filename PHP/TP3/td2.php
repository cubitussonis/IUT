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
        <form method="post" action="td3Affichage.php">
            <?php

                $supers = Array("Angel","Beast","Cyclops","Iceman");
                foreach ($supers as $super){
                    echo '<input type="checkbox" name="choix[]" value="'.$super.'">'.$super."<br>";
                } 
                

            ?>
            </select>
        <input type="submit" name="submit" value="Valider">
        </form>

    </body>
</html>