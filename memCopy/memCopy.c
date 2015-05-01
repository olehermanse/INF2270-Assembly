
// Simple code sample for memcpy-like function in asm (AT&T)
// Author: github.com/olehermanse

#include <stdio.h>
#include <string.h>

// Function written in assembly, from memCopy.s:
extern int memCopy(char* dest, char* src, int n);
// Alternate:
// extern int memCopy(void* dest, void* src, int n);

// Simple test program:
int main(void){
  char src[256];
  char dest[256];
  int rval = 0;

  sprintf(src, "Hey World!");//Set up src buffer
  rval = memCopy(dest,src,strlen(src)+1);//Call assembly function
  
  printf("Assembly function returned: %d\n", rval);
  printf("Source buffer: '%s'\n", src);
  printf("Destination buffer: '%s'\n", dest);
  return 0;
}
