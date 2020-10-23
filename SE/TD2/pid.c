#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int extract_ppid(int un_pid, char *name){
    int get1, get4;
    char *name_proc;
    char t;
    FILE* fic = NULL;

    char *nom = malloc( strlen("/proc//stat") + 4);
    char result[4];
    sprintf(result,"%d",un_pid);
    strcat(nom,"/proc/");
    strcat(nom,result);
    strcat(nom,"/stat");

    printf("%s",nom);
    fic = fopen(nom,"r");

    if(fic != NULL){
        printf("on peurt \n");
        fscanf(fic,"%d (%[^)]) %c %d",&get1,name_proc, t, &get4);
        printf("PID proc = %d", get1);
        printf("PID name = %s", name_proc);
        printf("PID proc parent = %d", get4);
    }

    fclose(fic);
    return 0;
}

int main(int argc, char *argv[]){
    char *test;
    extract_ppid(2035,test);

    return 0;
}