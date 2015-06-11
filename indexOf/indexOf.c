// Examples of assembly functions indexOf and contains
// Author: github.com/olehermanse
#include <stdio.h>

extern int indexOf(char c, char* str);
extern int contains(char c, char* str);

int main(void){
    char str[256];
    sprintf(str, "Hello World!");
    printf("\nIndex of 's' in '%s': %d\n",str, indexOf('s', str));
    printf("Does '%s' contain 's': %d\n",str, contains('s', str));
    printf("\nIndex of 'l' in '%s': %d\n",str, indexOf('l', str));
    printf("Does '%s' contain '!': %d\n\n",str, contains('!', str));
    return 0;
}
