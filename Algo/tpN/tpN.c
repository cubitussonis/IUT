#include <stdio.h>
#include <stdlib.h>
#include <string.h>


typedef struct{
    int numero;
    char nom[50];
    char type[50];
}animal;

typedef struct Elem {
     animal val;
     struct Elem *svt;
}element;

typedef struct {
    element *Tete;
    element *Queue;
}File;

typedef File Fanimal;


void affiche (animal a){
    printf("Nom animal: %s - numero : %d  - type : %s\n", a.nom, a.numero, a.type);
}


void saisie (animal *a, int id)
{
    printf("Nom de l'animal: ");
    scanf("%s", a->nom);
    printf("\n type de l'animal: ");
    scanf("%s", a->type);
    //printf("\n Numero de l'animal: ");
    //scanf("%d", a->numero);
    a->numero = id;
}


void initialisation (File *F)
{
    F->Queue=NULL;
    F->Tete=NULL;
}

int est_vide(File F)
{
    if((F.Queue==NULL) && (F.Tete==NULL)){
        return 1;
    }else{
        return 0;
    }
}

void afficherFile(File F){
    element *p;
    p = F.Tete;
    while (p != NULL){
        affiche(p->val);
        p = p->svt;
    }
}

int rechercher(File F,animal a){
    element *p;
    p = F.Tete;
    int trouve = 0;
    while (p != NULL && trouve == 0 ){
        if(strcmp(p->val.nom,a.nom) == 0 && strcmp(p->val.type,a.type) == 0){
            trouve = 1;
        }else{
            p = p->svt;
        }
    }
    
    return trouve;
}

void retrait(File *F){
    element *p;
    if(est_vide(*F) == 1){
        printf("La file est deja vide");
    }else{
        if(F->Tete==F->Queue){
            p=F->Tete;
            F->Tete=NULL;
            F->Queue=NULL;
            affiche(p->val);
            free(p);
        }else{
            p=F->Tete;
            F->Tete=p->svt;
            affiche(p->val);
            free(p);
        }
    }
}


void ajout(File *F, animal a){
    element *p;

    p=(element*)malloc(sizeof(element));
    p->val=a;
    p->svt=NULL;

    if ((F->Queue==NULL) && (F->Tete==NULL)){
        F->Queue=p;
        F->Tete=p;
    } else{
        F->Queue->svt=p;
        F->Queue=p;
    }
    
}

void ajouterAnimal(Fanimal *f, int *id)
{
    animal a;
    saisie(&a,*id);
    if(rechercher(*f,a) == 1){
        printf("l'animal existe deja");
    }else{
        affiche(a);
        ajout(f,a);
        *id = *id+ 1;
    }
}


int main(){
    
    Fanimal f;
    initialisation(&f);
    int choix = -1;
    int id = 1;
    
    while(choix!=0){
        printf("\n         --- Menu --- \n");
        printf("[1] - Ajouter un animal \n");
        printf("[2] - Sortir un animal \n");
        printf("[3] - Afficher file \n");
        printf("[0] - Quitter \n");
        scanf("%d", &choix);

        switch(choix)
        {
            case 1: ajouterAnimal(&f,&id);
                break;

            case 2: retrait(&f);
                break;
            
            case 3: afficherFile(f);
                break;

            case 0 : printf("Au revoir ! :) \n");
                break;

            default : printf("\n Erreur, entrez la valeur 1 pour ajouter un produit au stock ou la valeur 0 pour quitter. \n");
        }
    }
    
    return EXIT_SUCCESS;
