This example uses the esi and edi registers to copy data from one address in memory
to another. It is equivalent to:<br>

```C
int memCopy(char* dest, char* src, int n){
        // Copy data and increment pointers n times:
        while(n != 0){
          *dest = *src;   // Please don't segfault
          ++dest;
          ++src;
          --n;
        }
        return 0;
}
```
No error checking is done, this is left as an exercise for the reader.<br>
[<- Back to table of contents](./../)<br>
