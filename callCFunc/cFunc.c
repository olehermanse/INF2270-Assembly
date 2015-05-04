// This function is called from assembly code in callCFunc.s:
int cFunc(int input){
    return input * 2;       // Must do something, to ensure function call worked
}

// For Cross platform compatibility Linux <-> Mac OSX :
int _cFunc(int input){
    return cFunc(input);
}
