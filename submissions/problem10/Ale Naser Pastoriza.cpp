#include<bits/stdc++.h>

using namespace std;

int main() {
    int a1, b1, c1;
    int a2, b2, c2;
    int a3, b3, c3;

    scanf("%d %d %d", &a1, &b1, &c1);
    scanf("%d %d %d", &a2, &b2, &c2);
    scanf("%d %d %d", &a3, &b3, &c3);

    int ans = min({
        a2 + a3 + b1 + b3 + c1 + c2, // 1 2 3
        a2 + a3 + b1 + b2 + c1 + c3, // 1 3 2
        a1 + a3 + b2 + b3 + c1 + c2, // 2 1 3
        a1 + a3 + b1 + b2 + c2 + c3, // 2 3 1
        a1 + a2 + b2 + b3 + c1 + c3, // 3 1 2
        a1 + a2 + b1 + b3 + c2 + c3, // 3 2 1
    });
    printf("%d\n", ans);

    return 0;
}







