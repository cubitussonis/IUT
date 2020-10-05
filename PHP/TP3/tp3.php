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


    <form method="post" action="./cv.php"> 

        <input type="text" name="nom" placeholder="Nom" value="">
        <input type="text" name="prenom" placeholder="Prenom" value="">
        <input type="date" name="dateNaissance" value="">
        <input type="email" name="email" placeholder="Email" value="">
        <input type="url" name="site" placeholder="www.votresiteweb.com" value="">
        <input type="tel" name="phone" placeholder="telephone" value="">
        <input type="number" name="nbEnfant" min="0" max="10" placeholder="1" value="">
        <input type="color" name="color" placeholder="" value="">

        <select name="gender" id="gender">
            <option value="M.">M.</option>
            <option value="Mme">Mme</option>
        </select>

        <input type="submit" name="submit" value="Valider">


    </form>



    <form method="post" action="./satisfaction.php"> 

        <input type="radio" name="choix" value="Tres satisfait">Tres satisfait
        <input type="radio" name="choix" value="Plutot satisfait">Plutot satisfait
        <input type="radio" name="choix" value="Peu satisfait">Peu satisfait
        <input type="radio" name="choix" value="Pas satisfait">pas satisfait

        <input type="submit" name="submit" value="Valider">


    </form>

    </body>
</html>