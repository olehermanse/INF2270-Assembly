// Simple template for assembly code ( AT&T syntax )
// Author: github.com/olehermanse

#include <stdio.h>

// Function written in assembly, from variables.s:
extern int variables();

// Simple test program shows return value of assembly function:
int main(void){
    printf("Assembly function returned: %d\n", variables());
    return 0;
}
