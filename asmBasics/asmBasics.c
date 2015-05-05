// Simple template for assembly code ( AT&T syntax )
// Author: github.com/olehermanse

#include <stdio.h>

// Function written in assembly, from asmBasics.s:
extern int asmBasics(int input);        // Should return 2 * input

// Simple test program shows return value of assembly function:
int main(void){
    printf("Assembly function returned: %d\n", asmBasics(7));
    return 0;
}
