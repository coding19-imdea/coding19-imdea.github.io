#include <iostream>

using namespace std;

int main() {
    int t;
    cin >> t;

    for (int i = 0; i < t; ++i) {
        long long d, m;
        cin >> d >> m;

        long long j = 0;
        long long cnt = 1;
        for (; (1 << (j + 1)) <= d; ++j) {
            cnt = cnt * ((1 << j) + 1) % m;
        }
        long long rem = (1 << (j + 1)) - 1 - d;
        cnt = cnt * ((1 << j) + 1 - rem) % m;

        cout << (cnt + m - 1) % m << '\n';
    }
    return 0;
}
