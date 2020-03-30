#include<bits/stdc++.h>

using namespace std;

bool solved;
vector<string> sol;

void solve(vector<string> sk) {
    if (solved)
        return;
    bool any = 0;
    for (int i = 0; i < 9 && !any; i++) {
        for (int j = 0; j < 9 && !any; j++) {
            if (sk[i][j] == '0') {
                any = 1;
                set<char> st;
                for (int k = 0; k < 9; k++) {
                    st.insert(sk[i][k]);
                    st.insert(sk[k][j]);
                }
                for (int k = 3 * (i / 3); k < 3 * (i / 3) + 3; k++)
                    for (int l = 3 * (j / 3); l < 3 * (j / 3) + 3; l++)
                        st.insert(sk[k][l]);
                for (char n = '1'; n <= '9'; n++) {
                    if (!st.count(n)) {
                        vector<string> tmp = sk;
                        tmp[i][j] = n;
                        solve(tmp);
                    }
                }
            }
        }
    }
    if (!any) {
        solved = 1;
        sol = sk;
    }
}

int main() {
    string s;
    vector<string> sk;
    int TC = 50, ans = 0;
    while (TC--) {
        cin >> s >> s;
        sk.clear(); solved = false;
        for (int i = 0; i < 9; i++) {
            cin >> s;
            sk.push_back(s);
        }
        solve(sk);
        ans += 100 * (sol[0][0] - '0') +
                10 * (sol[0][1] - '0') +
                     (sol[0][2] - '0');
    }
    printf("%d\n", ans);
    return 0;
}