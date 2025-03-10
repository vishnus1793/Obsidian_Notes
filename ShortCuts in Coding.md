## Count Number of Digits
```
While(num){
    Count++;
    num/=10;
}
```

```
int Digits = log10(n) + 1;
```
------------------------------------------------------------------------
## Single Line to Swap two Numbers
```
a=a+b-(b=a)
```

 ```
 b=a;
 a=a+b-b;
```

```
a=a^b;
b=a^b;
a=a^b;

```
## Count the Set Bits(No of 1's in binary Forms)
```
while(n){
    count += n & 1;
    n >>=1;
}
```
```
while(n){
    n &= n-1;
    count ++;
}
```

## Calculate a power b
```
double normal_pow(double a, double b){
    return pow(a,b);
}
```

```
double fast_pow(double a, int b){
    double res = 0;
    while(b){
        if(b%2) res *= a;
        a*=a;
        b/=2; 
    }
    return res;
}
```