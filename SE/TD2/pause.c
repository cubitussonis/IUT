#include <stdio.h>

int main() {
    FILE *fd = fopen("__test__", "a+");
    sleep(9999);
    fclose(fd);
    return 0;
}