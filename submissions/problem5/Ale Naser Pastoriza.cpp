#include<bits/stdc++.h>

using namespace std;

#define X first
#define Y second
typedef vector<pair<int, int>> vii;

vii V;
bool cycle;
int N, x, y;
map<int, int> rgt;
map<int, int> mtc;
map<pair<int, int>, int> vis;

void dfs(int i, int out) {
    vis[{i, out}]++;
    if (vis[{i, out}] > 1) {
        cycle = 1;
        return;
    }
    if (!out)
        dfs(mtc[i], 1);
    else if (rgt.find(i) != rgt.end())
        dfs(rgt[i], 0);
}

int has_cycle(vii mt) {
    int n = (int)mt.size();
    for (int i = 0; i < n; i++) {
        int p = mt[i].first, q = mt[i].second;
        mtc[p] = q; mtc[q] = p;
    }
    bool any = false;
    for (int i = 0; i < N; i++) {
        vis.clear();
        cycle = 0; dfs(i, 1);
        if (cycle)
            return 1;
    }
    return 0;
}

int solve(int mask, vii mt) {
    if (mask == ((1 << N) - 1))
        return has_cycle(mt);
    int i, j, ans = 0;
    for (i = 0; i < N - 1; i++)
        if (!(mask & (1 << i)))
            break;
    for (j = i + 1; j < N; j++)
        if (!(mask & (1 << j))) {
            vii tmp = mt;
            tmp.push_back({i, j});
            ans += solve(mask | (1 << i) | (1 << j), tmp);
        }
    return ans;
}

int main() {
    scanf("%d", &N);
    for (int i = 0; i < N; i++) {
        scanf("%d %d", &x, &y);
        V.push_back({x, y});
    }
    sort(V.begin(), V.end());
    for (int i = 0; i < N; i++)
        for (int j = i + 1; j < N; j++)
            if (V[i].Y == V[j].Y) {
                rgt[i] = j;
                break;
            }
    vii v;
    printf("%d\n", solve(0, v));
    return 0;
}
