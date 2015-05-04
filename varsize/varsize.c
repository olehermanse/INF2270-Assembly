#include <stdio.h>

// This test program serves as a sanity check more than anything else
int main(void){
    printf("Size of char: %i\n", (int)sizeof(char));
    printf("Size of short: %i\n", (int)sizeof(short));
    printf("Size of int: %i\n", (int)sizeof(int));
    printf("Size of long: %i\n", (int)sizeof(long));
    printf("Size of long long: %i\n", (int)sizeof(long long));
    printf("Size of float: %i\n", (int)sizeof(float));
    printf("Size of double: %i\n", (int)sizeof(double));
    printf("Size of pointer(int*): %i\n", (int)sizeof(int*));
    return 0;
}
