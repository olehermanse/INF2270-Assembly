// Simple demonstration of how to find ascii value of a number from 0 to 9 in assembly
// Author: github.com/olehermanse

#include <stdio.h>

// Assembly function from asciiConvert.s :
extern int asciiConvert(int input);

// Print result for given integer value
void testForValue(int val){
	printf(	"ASCII value of '%i' = %d\n", val, asciiConvert(val));
}

// Test some possible inputs:
int main(void){
	int i = 0;
	for(i = -10; i< 11; ++i){
		testForValue(i);
	}
	testForValue(-16);
	testForValue(128);
	return 0;
}
