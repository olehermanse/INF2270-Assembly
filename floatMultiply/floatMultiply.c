// Code sample for using float functions in assembly language(AT&T)
// Author: github.com/olehermanse

#include <stdio.h>
#include <string.h>

// Function written in assembly, from floatMultiply.s:
extern float floatMultiply(float a, float b, float c);

// Simple test program:
int main(void){
    float rval = 0.0f;

    rval = floatMultiply(3.5f, 191.0f, 2.0f);           //Call assembly function

    printf("Assembly function returned: %f\n", rval);
    return 0;
}
