// This example demonstrates how you can call a c function from assembly
// Author: github.com/olehermanse

#include <stdio.h>

// Test program sends argument to assembly function and prints return value: 
extern int callCFunc(int input);
int main(void){
	printf(	"Assembly function returned: %d\n", callCFunc(21));
	return 0;
}
