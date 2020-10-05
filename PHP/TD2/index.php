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
        
            


            function chargerFichier($pathFile){

                $file = fopen($pathFile, 'r');
                while (!feof($file) ) {
                    $tabSupers[] = fgetcsv($file, 1024);
                }
                fclose($file);

                return $tabSupers;
            }


            echo '<pre>';
            print_r(chargerFichier("groupes.csv"));
            echo '</pre>';



            function createSchema(){
                include("./connexion.php");
                $req= $bdd->prepare('CREATE schema comics');
                $req->execute(array());
            }

            function createTableGroupe(){
                include("./connexion.php");
                $req= $bdd->prepare('CREATE TABLE comics.groupe(
                    num NUMERIC(4) PRIMARY KEY,
                    nom VARCHAR(30) not null');
                $req->execute(array());
            }

            function createTableSuper(){
                include("./connexion.php");
                $req= $bdd->prepare('CREATE TABLE comics.super(
                    num NUMERIC(4) PRIMARY KEY,
                    nom VARCHAR(30) not null,
                    img VARCHAR(100) not null)');
                $req->execute(array());
            }

        
            function copyIntoBDD(){
                include("./connexion.php");
                $req= $bdd->prepare("COPY comics.groupe FROM 'groupes.csv'");
                $req->execute(array());

            }
            copyIntoBDD();


        ?>



    </body>
</html>





