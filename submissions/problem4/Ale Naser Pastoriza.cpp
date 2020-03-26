#include<bits/stdc++.h>

using namespace std;

map<char, int> vis;
map<char, vector<char>> adj;

void dfs(char x) {
    vis[x]++;
    if (vis[x] > 1)
        return;
    for (char c : adj[x])
        dfs(c);
}

int main() {
    int T;
    string s, ans;
    bool any = false;

    scanf("%d\n", &T);
    while (T--) {
        cin >> s; ans += s;
        adj[s[0]].push_back(s[1]);
        adj[s[1]].push_back(s[2]);
    }

    sort(ans.begin(), ans.end());
    auto it = unique(ans.begin(), ans.end());
    ans = string(ans.begin(), it);

    for (char x : ans) {
        if (any)
            break;

        vis.clear(); dfs(x);
        if (vis[x] > 1)
            any = true;
    }

    if (any) {
        cout << "SMTH WRONG" << "\n";
    } else {
        int sz = (int)ans.size();
        for (int i = 0; i < sz; i++) {
            sort(ans.begin() + i, ans.end());
            for (int j = i + 1; j < sz; j++) {
                vis.clear();
                dfs(ans[j]);
                if (vis[ans[i]])
                    swap(ans[j], ans[i]);
            }
        }

        cout << ans << "\n";
    }

    return 0;
}