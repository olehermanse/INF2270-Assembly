The function finds the index of a character in a string. It is equivalent to:<br>

```C
int indexOf(char c, char* str){
    if(str == 0)
        return -1;
    int i = 0;
    while(1){
        if(*str == c) return i;     //Note: if c is 0, the function returns strlen
        if(*str == 0) return -1;
        ++str;
        ++i;
    }
}

int contains(char c, char* str){
    if(indexOf(c, str) == -1)
        return 0;
    return 1;
}
```
[<- Back to table of contents](./../../../)<br>
