<?php
include('modele/getData.php');
function displaySelect($path){
    

    foreach(getSupers($path) as $s){
        if($s[0] != 'num'){
            echo '<option value="'.$s[0].'">'.$s[1].'</option>';
        }
    }

    
}


function displayCollab($path,$num){
    
    $membres = getMembres($path);
    $supers = getSupers($path);

    $selectGroupe = trouverGroupe($num,$membres);
    echo $selectGroupe;
    $numCollab[] = getNumCollab($selectGroupe,$membres);
    //echo $numCollab[1];

    for($i=0;$i<count($numCollab[0]);$i++){
        $trouve = false;
        echo "<tr>";
        $j=0;
        while($trouve ==false && $j < count($supers)){
            if($numCollab[0][$i] == $supers[$j][0]){
                $trouve = true;
                echo '<td>'.$supers[$j][0].'</td>';
                echo '<td>'.$supers[$j][1].'</td>';
            }else{
                $j++;
            }
        }
        echo "</tr>";
    }

}




function trouverGroupe($num,$tab){

    $trouve = false;
    $c =0;
    $groupe = -1;
    while($trouve == false && $c < count($tab)){
        if($tab[$c][0]==$num){
            $groupe = $tab[$c][1];
            $trouve = true;
        }else{
            $c=$c+1;
        }
    }
}


function getNumCollab($selectGroupe,$membres){
    $collab=[];
    for($i =0; $i < count($membres);$i++){
        if($membres[$i][1]==$selectGroupe){
            array_push($collab,$membres[$i][0]);
        }
    }

    return $collab;
}

?>