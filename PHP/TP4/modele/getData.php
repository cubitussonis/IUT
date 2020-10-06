<?php

    function getGroupes($path){

        $file = fopen($path.'/groupes.csv', 'r');
        while (!feof($file) ) {
            $tabSupers[] = fgetcsv($file, 1024);
        }
        fclose($file);

        return $tabSupers;

    }
    
    function getMembres($path){

        $file = fopen($path.'/membres.csv', 'r');
        while (!feof($file) ) {
            $tabSupers[] = fgetcsv($file, 1024);
        }
        fclose($file);

        return $tabSupers;

    }

    function getSupers($path){

        $file = fopen($path.'/supers.csv', 'r');
        while (!feof($file) ) {
            $tabSupers[] = fgetcsv($file, 1024);
        }
        fclose($file);

        return $tabSupers;

    }


?>