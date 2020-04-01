#include<bits/stdc++.h>

using namespace std;

typedef long long ll;

int main() {
    int T, N;
    vector<ll> V(19);
    vector<vector<int>> nz(2, vector<int>(2));
    vector<vector<int>> wz(2, vector<int>(2));

    for (int i = 1; i < 10; i++)
        for (int j = 1; j < 10; j++) {
            int p = (i + j) % 2;
            int c = (i + j) >= 10;
            nz[p][c]++;
        }

    for (int i = 0; i < 10; i++)
        for (int j = 0; j < 10; j++) {
            int p = (i + j) % 2;
            int c = (i + j) >= 10;
            wz[p][c]++;
        }

    for (int i = 2; i <= 18; i++) {
        if (i % 2 == 0) {
            V[i] = nz[1][0];
            for (int j = 1; j < i / 2; j++)
                V[i] *= wz[1][0];
        } else {
            if (i % 4 == 3) {
                V[i] = 5 * wz[1][1];
                for (int j = 0; j < (i - 3) / 2; j++)
                    if (j % 2)
                        V[i] *= wz[0][0];
                    else
                        V[i] *= nz[1][1];
            }
        }
    }

    for (int i = 2; i <= 18; i++)
        V[i] += V[i - 1];
    printf("%lld\n", V[8]);

    return 0;
}