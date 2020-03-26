#include<bits/stdc++.h>

using namespace std;

set<char> cs;
map<char, set<char>> in;

int main() {
    int T;
    string s, ans;
    bool any = false;

    scanf("%d\n", &T);
    while (T--) {
        cin >> s;
        cs.insert({s[0], s[1], s[2]});
        in[s[1]].insert(s[0]);
        in[s[2]].insert(s[1]);
    }

    while (!cs.empty()) {
        bool any = false;
        for (auto c : cs) {
            if (!in[c].size()) {
                ans += c;
                for (auto tmp : cs)
                    in[tmp].erase(c);
                cs.erase(c);
                any = true;
                break;
            }
        }
        if (!any) {
            puts("SMTH WRONG");
            return 0;
        }
    }

    cout << ans << '\n';

    return 0;
}