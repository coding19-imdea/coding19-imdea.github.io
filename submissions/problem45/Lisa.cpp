#include <iostream>
#include <vector>
#include <unordered_set>

using namespace std;

bool get_cycle(const vector<vector<int>> &g, int v, int p, vector<int> &stack, unordered_set<int> &s) {
    if (s.contains(v)) {
        for (int u : stack) {
            if (u == v) {
                break;
            }
            s.erase(u);
        }
        return true;
    }

    stack.push_back(v);
    s.insert(v);
    for (int u : g[v]) {
        if (u != p && get_cycle(g, u, v, stack, s)) {
            return true;
        }
    }
    stack.pop_back();
    s.erase(v);
    return false;
}

int count(const vector<vector<int>> &g, int v, int p, const unordered_set<int> &s) {
    int cnt = 1;
    for (int u : g[v]) {
        if (u != p && !s.contains(u)) {
            cnt += count(g, u, v, s);
        }
    }
    return cnt;
}

int main() {
    int t;
    cin >> t;

    for (int i = 0; i < t; ++i) {
        int n;
        cin >> n;

        vector<vector<int>> g(n);
        for (int j = 0; j < n; ++j) {
            int x, y;
            cin >> x >> y;
            g[x - 1].emplace_back(y - 1);
            g[y - 1].emplace_back(x - 1);
        }

        vector<int> stack;
        unordered_set<int> s;
        assert(get_cycle(g, 0, -1, stack, s));

        long long cnt = n * (long long) (n - 1);
        for (int v : s) {
            int tree = count(g, v, -1, s);
            long long paths = tree * (tree - 1) / 2;
            cnt -= paths;
        }
        cout << cnt << '\n';
    }
    return 0;
}
