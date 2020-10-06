

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
    
        <h1>Recherchez vos collaborateurs </h1>

        <form action="./" method="post">
        <select name="selectSuper" id="selectSuper">
            <?php
                include('controller/getSelect.php');
                displaySelect('modele');
            ?>
        </select>
        <input type="submit" value="valider">
        </form>
        <table>
            <tr>
                <th>Num</th>
                <th>Nom</th>
            </tr>
            
        <?php
            if(isset($_POST['selectSuper'])){
                displayCollab('modele',$_POST['selectSuper']);
            }
        ?>
        </table>
    </body>
</html>