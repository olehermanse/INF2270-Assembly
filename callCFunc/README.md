This example shows how to call a function written in C from assembly code. 
Our assembly code is equivalent to:<br>

```C
int callCFunc(int input){
        return cFunc(input);  // Pass argument to c function and return its return value
}
```

where cFunc is an arbitrary function defined in cFunc.c.<br>
[<- Back to table of contents](./../../../)<br>
