#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>




//exercice 1: fonction d'Ackermann

/*int Acker(int m, int n){

    if(m==0 && n >0){
        return n+1;
    }else if(m>0 && n ==0){
        Acker(m-1,1);
        //printf("Acker (%d,1)",m-1);
    }else{
        Acker(m-1,Acker(m,n-1));
    }

}*/

typedef char chaine20[21];

typedef struct{
    chaine20 nom,prenom;
    int age;
}personne;

typedef struct elem{
    personne val;
    struct elem *next;
}element;

typedef element *pile;


void creation(pile *P){
    *P = NULL;
}


void afficherPersonne(personne pers){
    printf("%-20s %-20s %d",pers.prenom,pers.nom,pers.age);
}

bool est_vide(pile P){
    return (P==NULL);
}

void empiler(pile *P, personne pers){

    element *PT;

    PT = (element*)malloc(sizeof(element));
    PT->val=pers;
    PT->next=*P;
    *P=PT;
    //printf("%d",est_vide(*P));
}

personne sommet(pile p){
    return (p->val);
}

void depiler(pile *P){
    element *PT;
    PT=*P;
    *P = (*P)->next;
    free(PT);
    PT=NULL;
}



void remplirPile (pile *P){
    personne pers;
    printf("Rentre le prenom ");
    scanf("%s",&pers.prenom);
    printf("Rentre le nom ");
    scanf("%s",&pers.nom);
    printf("Rentre l'age ");
    scanf("%d",&pers.age);

    empiler(P,pers);

}



void afficherPile(pile *p){

    personne pers;

    while(!est_vide(*p)){
        pers = sommet(*p);
        afficherPersonne(pers);
        depiler(p);
    }

}

int main()
{

    pile p;
    creation(&p);
    remplirPile(&p);
    //printf("%d",est_vide(p));
    afficherPile(&p);

    //int result = Acker(2,3);
    //printf("Acker(2,3) = %d",result);


    return 0;
}




