#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

typedef char chaine20[21];
typedef struct{
    chaine20 nom;
    chaine20 couleur;
    int tRoue;
}velo;

typedef struct Elem {
     velo val;
     struct Elem *svt;
}element;

typedef struct {
    element *Tete;
    element *Queue;
}File;

typedef element* garage;
typedef File magasin;


bool est_vide(magasin F)
{
    if((F.Queue==NULL) && (F.Tete==NULL)){
        return true;
    }else{
        return false;
    }
}

void affichage (velo v){
    printf("Nom du velo: %s - couleur : %s  - taille de roues : %d\n", v.nom, v.couleur, v.tRoue);
}

void saisie (velo *v)
{
    int troue =0;
    printf("Nom du velo: ");
    scanf("%s", v->nom);
    printf("\n couleur du velo: ");
    scanf("%s", v->couleur);
    printf("\n taille des roues: ");
    scanf("%d", &troue);
    v->tRoue = troue;
}

void afficherFile(magasin F){
    element *p;
    p = F.Tete;
    while (p != NULL){
        affichage(p->val);
        p = p->svt;
    }
}

void affichage_couleur(magasin F,chaine20 nom){
    element *p;
    p = F.Tete;
    while (p != NULL){
        if(strcmp(p->val.couleur, nom) == 0){
            affichage(p->val);
        }
        
        p = p->svt;
    }
}

void initialisation (magasin *F)
{
    F->Queue=NULL;
    F->Tete=NULL;
}


int rechercher(magasin F,velo v){
    element *p;
    p = F.Tete;
    int trouve = 0;
    while (p != NULL && trouve == 0 ){
        if(strcmp(p->val.nom,v.nom) == 0 ){
            trouve = 1;
        }else{
            p = p->svt;
        }
    }
    
    return trouve;
}


//je n'ai pas eu le temps de faire la vente en fonction du nom du velo, à defaut j'ai fait une vente classique de la file (first in first out)
void vente(magasin *F){
    element *p;
    if(est_vide(*F) == 1){
        printf("La file est deja vide");
    }else{
        if(F->Tete==F->Queue){
            p=F->Tete;
            F->Tete=NULL;
            F->Queue=NULL;
            affichage(p->val);
            free(p);
        }else{
            p=F->Tete;
            F->Tete=p->svt;
            affichage(p->val);
            free(p);
        }
    }
}




void achat(magasin *F, velo v){
    element *p;

    p=(element*)malloc(sizeof(element));
    p->val=v;
    p->svt=NULL;

    if ((F->Queue==NULL) && (F->Tete==NULL)){
        F->Queue=p;
        F->Tete=p;
    } else{
        F->Queue->svt=p;
        F->Queue=p;
    }
    
}


void ajouterVelo(magasin *f)
{
    velo v;
    saisie(&v);
    if(rechercher(*f,v) == 1){
        printf("Le velo existe deja");
    }else{
        affichage(v);
        achat(f,v);
    }
}





/* ----------------- Pile ------------------*/

void creation(garage *g) {
  *g = NULL;
}

void empiler(garage *p, velo v) {
  element *ptr = NULL;

  if ((ptr = (element*)malloc(sizeof(element))) == NULL) {
    perror("malloc");
    exit(1);
  }
  ptr->val = v;
  ptr->svt = *p;
  *p = ptr;
}

void depiler(garage *p) {
  element *ptr = NULL;
  ptr = *p;       // ptr = valeur de p
  *p = (*p)->svt; // update sommet de la pile
  free(ptr);
  ptr = NULL;
}

velo sommet(garage p) {
  velo e;
  e = p->val;
  return (e);
}

bool est_vide_g(garage p) {
  return (p == NULL);
}


void ajouterVeloGarage(garage *p)
{
    velo v;
    saisie(&v);
    affichage(v);
    empiler(p,v);
    
}

void recupererVelo(garage *p, chaine20 nom){
    if(est_vide_g(*p) == false){
        velo v = sommet(*p);
        while(strcmp(v.nom,nom)!=0 && est_vide_g(*p) == false){
            depiler(p);
            if(est_vide_g(*p) == false){
                v = sommet(*p);
            }
        }

        if(est_vide_g(*p) == true){
            printf("Le velo n'etait pas dans le garage");
        }else{
            affichage(v);
        }
    }else{
        printf("Il n'y pas de velo dans le garage, le garage est maintenant vide");
    }
}

int fibo(int n){
    if(n == 0){
        return 0;
    }else if(n == 1){
        return 1;
    }else{
        return fibo(n-1) + fibo(n-2);
    }
}


int RoueFibonnaci(velo v){
    return fibo(v.tRoue);

}


int main(){
    
    magasin f1,f2,fc;
    chaine20 c,v;
    garage p;
    int resFibo;

    initialisation(&f1);
    initialisation(&f2);
    initialisation(&fc);
    fc = f1;
    creation(&p);
    int choix = -1;
    int choixRep = 1;
    
    while(choix!=0){
        printf("\n         --- Menu --- \n");
        printf("[1] - Acheter un velo \n");
        printf("[2] - Vendre un velo \n");
        printf("[3] - Afficher tous les velos \n");
        printf("[4] - Afficher tous les velos d'une couleur \n");
        printf("[5] - Changer de magasin \n");
        printf("[6] - Ajouter velo dans le garage \n");
        printf("[7] - Prendre un velo specifique du garage \n");
        printf("[8] - Calculer le terme de la suite de Fibonnaci pour le premier velo du garage \n");
        printf("[0] - Quitter \n");
        scanf("%d", &choix);

        switch(choix)
        {
            case 1: ajouterVelo(&fc);
                break;

            case 2: vente(&fc);
                break;
            
            case 3: afficherFile(fc);
                break;
            
            case 4: 
                    printf("Quelle couleur de velo voulez vous afficher : ");
                    scanf("%s", c);
                    affichage_couleur(fc,c);
                break;
            
             case 5:printf("\nSaisir le magasin voulu (1 ou 2) : \n");
                    scanf("%d", &choixRep);
                    if (choixRep==1){
                        f2 = fc;
                        fc=f1;
                    }else if(choixRep==2){
                            f1 =fc;
                            fc=f2;
                    }else{
                         printf("Ce magasin n'existe pas, vous restez donc sur le repertoire actuel");
                    }
                break;
            
            case 6: ajouterVeloGarage(&p);
                break;
            
            case 7: printf("Quel velo voulez vous prendre : ");
                    scanf("%s", v);
                    recupererVelo(&p,v);
                break;

            case 8: resFibo = RoueFibonnaci(sommet(p));
                    printf("le terme de la suite de fibonacci est : %d ",resFibo);
                break;

            case 0 : printf("Au revoir ! :) \n");
                break;

            default : printf("\n Erreur, commande incorrecte. \n");
        }
    }
    
    return EXIT_SUCCESS;

}