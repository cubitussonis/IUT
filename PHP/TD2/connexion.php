
<?php
    try
    {
    	$bdd = new PDO("pgsql:host=148.60.237.2;dbname=pg_mlongeanie",'mlongeanie', '#Ftllo23!');
    	$bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch(Exception $e)
    {
    				die('Erreur : '.$e->getMessage());
    }

?>