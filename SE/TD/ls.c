#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <dirent.h>


/*int main(int argc, char *argv[]){
    DIR *dir;
    struct dirent *dp;
    struct stat s;

    if(argc ==2){
        dir = opendir(argv[1]);
        
        while((dp = readdir(dir)) !=NULL){
            printf("%s \n",dp->d_name);
        }
       
    }else if(argc == 3){
        if(strcmp(argv[1],"-ali")==0){
            dir = opendir(argv[2]);
        
            while((dp = readdir(dir)) !=NULL){
                stat(dp->d_name, &s);
                //printf("%d \n", s.st_mode);
                if(S_ISDIR(s.st_mode)){
                    printf("d %d %ld %s \n",s.st_mode,dp->d_ino,dp->d_name);
                }else{
                    printf("- %d %ld %s \n",s.st_mode,dp->d_ino,dp->d_name);
                }
                
            }
        }
    }
    
    return 0;
}*/



void list(char *nom){
    DIR *dir;
    struct dirent *dp;
    dir = opendir(nom);
    int trouve = 0;
    while((dp = readdir(dir)) !=NULL){
        printf("%s \n",dp->d_name);
        if(strcmp(dp->d_name,"..")==0){
            trouve = 1;
            printf("trouve");
        }
    }
    
    if(trouve ==1){
        char *parent = malloc(strlen(nom) + strlen("../"));
        strcat(parent,"../");
        strcat(parent,nom);
        printf("-------------Changement de dossier------------------ \n");
        list(parent);
    }
}



int main(int argc, char *argv[]){
    if(argc == 2){
        list(argv[1]);
    }

    return 0;
}