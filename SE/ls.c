#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]){

    int i = 1;
    printf("%d \n",argc);
    /*for(i=0; i< argc; i++){
        if(argv[i][0] == '-'){
             printf("%s \n",argv[i]);
        
        }
    }*/
    int trouve = 0;
    if(argc >1){
        while(i <= (argc - 2) && trouve == 0){
            if(argv[i][0] == '-'){
                printf("%s \n",argv[i]);
                i++;
            }else{
                trouve = 1;
                printf("Il manque un tiret \n");
            }
        }
        if(trouve == 0){
            if(argv[argc-1][0] == '-'){
                printf("il devrait pas y avoir un tiret");
            }else{
                printf("%s \n",argv[argc-1]);
            }
        }
    }

    /*for(i=0; i< argc; i++){
        printf("%s \n",argv[i]);
    }*/




    return 0;
}