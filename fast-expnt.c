#include <stdio.h>

int fast_mult_iter(int a, int b, int n) {
    
    return 0;
}

int fast_mult_recursive(int a, int b, int n) {
    if (n == 1) return a;
    else 
        return fast_mult_recursive(a+b, b, n-1);
}

int fast_expnt(int a, int b, int n) {
    if (!n) return a;
    else if (!(n & 1)) 
        return fast_expnt(a * b * b, b, n - 2); // (b^2n) = (b^ n/2)^2
    else 
        return fast_expnt(a*b, b, n-1);
}

int main() {
    int temp;
    int base = 2;

    for (int i = 0; i <= 10; i++) {
        temp = fast_expnt(1, base, i);
        printf("%d^%d = %d\n", base, i, temp);
    }

    int first = 5;
    int second = 4;
    for (int i = 0; i <= 10; i++) {
        temp = fast_mult_recursive(first, first, second);
        printf("%d*%d = %d\n", first, second, temp);
    }
}
