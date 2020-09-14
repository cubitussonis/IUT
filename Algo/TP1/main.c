#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*typedef char chaine20[21];
typedef char chaine3[4];

typedef struct {
    chaine20 nom;
    chaine20 monnaie;
    chaine3 sigle;
}pays;*/

#define MAX 10
typedef int tab [MAX];


int dicho (int val,tab t, int i, int j){

    int index = (int)(j+i)/2;
    printf("index he = %d \n", index);
    int result = 0;
    if(i != j){
        if(val == t[i] || val == t[j]){
            result = 1;
        }else if(t[index] == val ){
            result = 1;
        }else if(t[index] < val){
            dicho(val,t,index,j);
        }else{
            dicho(val,t,i,index);
        }
    }

    return result;
}


int main(){

    //exercice 1

    /*int x = 100;
    int *pt;
    pt = &x;
    printf("x= %d \n", x);
    x++;
    printf("x= %d \n", x);
    printf("\n saisir x = ");
    scanf("%d",&x);
    printf("x= %d \n", x);


    printf("x= %d \n", *pt);
    (*pt)++;
    printf("x= %d \n", *pt);
    printf("\n saisir x = ");
    int n;
    scanf("%d \n",pt);
    printf("x= %d \n", *pt);

    _______________________________________________________________________________________________
    */

    //exercice 2

    //pays P1;

    /*printf("saisir nom pays =");
    scanf("%s",&P1.nom);
    printf("saisir monnaie du pays = ");
    scanf("%s",&P1.monnaie);
    printf("saisir sigle pays = ");
    scanf("%s",&P1.sigle);*/

    //printf("%s \n", P1.nom);
    //printf("%s \n", P1.monnaie);
    //printf("%s \n", P1.sigle);

    //pays *pt;

    //pt = (pays*)malloc(sizeof(pays));

    /*strcpy((*pt).nom, "France");
    strcpy((*pt).monnaie, "euro");
    strcpy((*pt).sigle, "$");

    printf("nom  = %s \n", (*pt).nom);
    printf("monnaie  = %s \n ", (*pt).monnaie);
    printf("sigle  = %s \n ", (*pt).sigle);

    strcpy(pt->nom, "France");
    strcpy(pt->monnaie, "euro");
    strcpy(pt->sigle, "$");

    printf("nom  = %s \n", pt->nom);
    printf("monnaie  = %s \n", pt->monnaie);
    printf("sigle  = %s \n", pt->sigle);*/


    /*printf("saisir nom pays =");
    scanf("%s",&(*pt).nom);
    printf("saisir monnaie du pays = ");
    scanf("%s",&(*pt).monnaie);
    printf("saisir sigle pays = ");
    scanf("%s",&(*pt).sigle);Exercice 3Soit le type tab défini comme suit : #define MAX 10typedef int t

    printf("nom  = %s \n", pt->nom);
    printf("monnaie  = %s \n", pt->monnaie);
    printf("sigle  = %s \n", pt->sigle);

    free(pt);*/

    tab t[] = {1,2,3,4,5,6,7,8,9,10};

    int result = dicho(8,t,0,9);
    printf("%d", result);


    return 0;
}
