#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef char chaine10[11];

typedef char chaine20[21];

typedef struct {
    chaine20 nom;
    chaine20 categorie;
    chaine10 telephone;
    } contact;

typedef struct elem {
    contact val;
    struct elem *svt;
    } element;

typedef element *Repertoire;


// Partie 1 - Question 1

void initialiser(Repertoire *Rep)
{
    *Rep=NULL;
}

// Partie 1 - Question 2

void afficherUnContact(contact c)
{
    printf("\n Nom: %s \n Categorie: %s \n Telephone: %s", c.nom, c.categorie, c.telephone);
}

// Partie 1 - Question 3

void afficherTous(Repertoire Rep)
{
    element *tmp = Rep;

    if (Rep==NULL)
    {
        printf("Il n'y a pas de contacts dans le repertoire.\n");
    }
    else
    {
        while(tmp!=NULL)
        {
            afficherUnContact(tmp->val);
            tmp=tmp->svt;
        }
    }
}

// Partie 1 - Question 4

void ajouterQueue(Repertoire *Rep, contact c)
{
    element *p;
    p=(element*)malloc(sizeof(element));

    strcpy(p->val.nom,c.nom);
    strcpy(p->val.categorie,c.categorie);
    strcpy(p->val.telephone,c.telephone);
    p->svt=NULL;

    if(*Rep==NULL)
    {
        *Rep=p;
    }
    else
    {
        while(p->svt!=NULL)
        {
            p=p->svt;
        }
        p->svt=*Rep;
        *Rep=p;
    }
}

// Partie 1 - Question 5

element* rechercher(Repertoire Rep, chaine20 nom)
{
    element *tmp=Rep;

    if(tmp==NULL)
    {
        printf("Il n'y a pas de contacts dans le repertoire.\n");
    }
    else
    {
        while(tmp!=NULL)
        {
            if(strcmp(tmp->val.nom,nom)==0) // 0 = même nom
            {
                return tmp;
            }
            tmp=tmp->svt;
        }
    }
    printf("Le contact n'existe pas.\n");
    return NULL;
}


// Partie 1 - Question 6

bool supprimer(Repertoire * Rep, chaine20 nom)
{
    element * prec;
    element * elem;
    element * par;
    element * p;
    elem = rechercher(*Rep, nom);
    if(elem!=NULL){
        par=(*Rep);
        prec=NULL;
        while(par!=elem){
            prec=par;
            par=par->svt;
        }
        if(prec==NULL){
            p=(*Rep);
            (*Rep)=(*Rep)->svt;
        } else {
            p=elem;
            prec->svt=elem->svt;
        }
        return true;
    } else {
        return false;
    }
    free(p);
}

// Partie 2 - Question 1

void ajouterContact(Repertoire *Rep)
{
    contact c;
    printf("\nSaisir le nom du contact : \n");
    scanf("%s", c.nom);
    printf("\nSaisir la categorie du contact : \n");
    scanf("%s", c.categorie);
    printf("\nSaisir le numero du contact : \n");
    scanf("%s", c.telephone);
    ajouterQueue(Rep, c);
}

// Partie 2 - Question 2

void chercherNumero(Repertoire Rep)
{
    chaine20 nom;
    printf("\nSaisir le nom du contact: \n");
    scanf("%s", nom);
    element * tmp = rechercher(Rep, nom);
    if(tmp!=NULL)
    {
        printf("Categorie: %s, Numero de telephone: %s\n", tmp->val.categorie, tmp->val.telephone);
    }
}

// Partie 2 - Question 3

void modifierContact(Repertoire *Rep)
{
    chaine20 nom;
    chaine20 categorie;
    chaine20 telephone;
    printf("Saisir le nom du contact a modifier : \n");
    scanf("%s", nom);
    element * tmp = rechercher(*Rep, nom);
    if(tmp!=NULL)
    {
        printf("Saisir la nouvelle categorie du contact : \n");
        scanf("%s", categorie);
        printf("Saisir le nouveau numero de telephone du contact : \n");
        scanf("%s", telephone);
        strcpy(tmp->val.categorie,categorie);
        strcpy(tmp->val.telephone,telephone);
    }
}

// Partie 2 - Question 4

void supprimerContact(Repertoire *Rep)
{
    chaine20 nom;
    printf("\nSaisir le nom du contact a supprimer : \n");
    scanf("%s", nom);
    supprimer(Rep, nom);
}


// Partie 3 - Question 1

void afficherMenu()
{
    printf("\n    --- Menu --- \n");
    printf("[1] - Afficher la liste des contacts du repertoire\n");
    printf("[2] - Ajouter un contact au repertoire\n");
    printf("[3] - Chercher le numero de telephone d'un contact\n");
    printf("[4] - Modifier un contact du repertoire\n");
    printf("[5] - Supprimer un contact du repertoire\n");
    printf("[6] - Changer le repertoire courant\n");
    printf("[0] - Quitter\n");
}

// Partie 3 - Question 2

int main()
{
int choix = -1;
    int choixRep = 1;
    Repertoire Rep1, Rep2, Rep3, RepC;
    initialiser(&Rep1);
    initialiser(&Rep2);
    initialiser(&Rep3);
    initialiser(&RepC);
    RepC=Rep1;
    while(choix!=0)
    {
        afficherMenu();
        scanf("%d", &choix);
        switch(choix)
        {
            case 1: printf("\nRepertoire %d :\n", choixRep);
                    afficherTous(RepC);
                    break;

            case 2: ajouterContact(&RepC);
                    break;

            case 3: chercherNumero(RepC);
                    break;

            case 4: modifierContact(&RepC);
                    break;

            case 5: supprimerContact(&RepC);
                    break;

            case 6: printf("\nSaisir le repertoire voulu (1, 2 ou 3) : \n");
                    scanf("%d", &choixRep);
                    if (choixRep=1)
                    {
                        RepC=Rep1;
                    }
                    else if(choixRep=2)
                       {
                            RepC=Rep2;
                       }
                       else if(choixRep=3)
                        {
                            RepC=Rep3;
                        }
                        else
                        {
                            printf("Ce repertoire n'existe pas, vous restez donc sur le repertoire actuel");
                        }
                    break;

            case 0: printf("Au revoir !");
                    break;

            default: printf("\nErreur, veuillez saisir 1, 2, 3, 4, 5, 6 ou 0 pour quitter.\n");
        }
    }
    return EXIT_SUCCESS;
}
