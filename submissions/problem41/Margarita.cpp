#include <bits/stdc++.h>
using namespace std;
#define forr(i,a,b) for(ll i=(a); i<(b); i++)
#define forn(i,n) forr(i,0,n)
#define zero(v) memset(v, 0, sizeof(v))
#define forall(it,v) for(auto it=v.begin();it!=v.end();++it)
#define pb push_back
#define fst first
#define snd second
#define num first
#define div second
typedef long long ll;
typedef long double ld;
typedef pair<ll,ll> pll;
#define dforn(i,n) for(int i=n-1; i>=0; i--)
#define sz(x) ((int)((x).size()))

bool isTriangleNumber(ll n){
    ll a = sqrt(2*n);
    return a*(a+1) == 2*n;
}

bool isTriangleStr(string s){
    int n = 0;
    for(char c : s) if('A' <= c and c <= 'Z') n+= c - 'A' + 1;
    return isTriangleNumber(n);
}


int main() {
    string s;
    ll res = 0;
    while(getline(cin,s, ',')){
        if(isTriangleStr(s)) res++;
    }
    
    cout << res << endl; 
    
}
