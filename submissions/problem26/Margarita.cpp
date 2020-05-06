#include <bits/stdc++.h>
using namespace std;
#define forr(i,a,b) for(ll i=(a); i<(b); i++)
#define forn(i,n) forr(i,0,n)
#define zero(v) memset(v, 0, sizeof(v))
#define forall(it,v) for(auto it=v.begin();it!=v.end();++it)
#define pb push_back
#define fst first
#define snd second
typedef long long ll;
typedef pair<ll,ll> pll;
#define dforn(i,n) for(int i=n-1; i>=0; i--)
#define sz(x) ((int)((x).size()))

int main() {
    int res = 0;
    string s; cin >> s;
    int sum = 0;
    for(auto c: s){
        if(c == '(') sum++;
        else sum--;
        if(sum < 0) {
            sum = 1;
            res++;
        }
    }
    res += sum/2;

    cout << res << endl;
    return 0;
}
