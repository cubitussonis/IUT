<?php
    //print_r($_POST["choix"]);
    echo "<ul>";
    foreach($_POST["choix"] as $super){
        echo "<li>".$super."</li>";
    }
    echo "</ul>";
    

?>