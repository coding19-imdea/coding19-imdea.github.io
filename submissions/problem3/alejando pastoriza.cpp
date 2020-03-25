#include<bits/stdc++.h>

using namespace std;

void print_vector(vector<char> V) {
    int n = (int)V.size();
    if (!n) {
        printf("[]\n");
        return;
    }
    printf("[");
    for (int i = 0; i < n - 1; i++)
        printf("%c, ", V[i]);
    printf("%c]\n", V[n - 1]);
}

int main() {
    string s;
    vector<char> V;
    set<pair<char, char>> op;
    map<pair<char, char>, char> cs;
    int TC, C, D, N, S = 0, cc = 0;

    scanf("%d\n", &TC);
    while (TC--) {
        V.clear();
        op.clear();
        cs.clear();
        scanf("%d\n", &C);
        for (int i = 0; i < C; i++) {
            cin >> s;
            cs[{s[0], s[1]}] = s[2];
            cs[{s[1], s[0]}] = s[2];
        }
        scanf("%d\n", &D);
        for (int i = 0; i < D; i++) {
            cin >> s;
            op.insert({s[0], s[1]});
            op.insert({s[1], s[0]});
        }
        scanf("%d\n", &N);
        cin >> s;
        if (N) {
            V.push_back(s[0]);
            for (int i = 1; i < N; i++) {
                bool is_op = false;
                int sz = (int)V.size();
                for (int j = 0; j < (int)V.size() && !is_op; j++)
                    is_op |= op.count({V[j], s[i]});
                if (cs.find({V[sz - 1], s[i]}) != cs.end())
                    V[sz - 1] = cs[{V[sz - 1], s[i]}];
                else if (is_op)
                    V.clear();
                else
                    V.push_back(s[i]);
            }
        }
        printf("Case #%d: ", ++cc);
        print_vector(V);
        S += V.size();
    }
    printf("%d\n", S);

    return 0;
}