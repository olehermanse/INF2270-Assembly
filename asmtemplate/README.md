This is the first, and simplest example. This shows how to define a function
in assembly language and call it from a main function in C. For simplicity's sake
we will always use a testprogram in C to test our assembly functions ( routines ).<br>

The function in this example takes an integer n and returns (n + 9000). It is equivalent
to:<br>

```C
int asmtemplate(int input){
        return input + 9000;
}
```
[<- Back to table of contents](./../README.md#TOC)<br>
