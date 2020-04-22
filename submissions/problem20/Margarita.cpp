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

int n;

int max_sum;
int min_sum;

ll dp[1<<11][7][10][10][5][10];

ll exp_10[18];

ll to_num(int a, int b, int c){
    ll res;
    if(c < 10) res = b*10 + c;
    else res = b*100 + c;
    
    if(res <100) res += a*100;
    else res += a*1000;
    
    return res;
}

ll f(int mask, int out_first, int in_first, int last, int pos, int s){
    ll &res = dp[mask][out_first][in_first][last][pos][s];
    if(res!=-1) return res;
    int sum = out_first + in_first + s;
    
    res = 0;
    
    if(pos == n-1){
        int a = sum - in_first - last;
        if(a > out_first and a <= 2*n and !(mask&(1<<a))) return res = to_num(a,last,in_first);
        return res;
    }
    
    bool ten_used = mask & (1<<10);
    if(pos == 0){
        forr(a,1,n+2) forr(b,1,2*n) forr(c,1,2*n) if(a!=b and b!=c and c != a and a+b+c >= min_sum and a+b+c <= max_sum){
            ll act = f((1<<a) + (1<<b) + (1<<c),a,b,c,1,c);
            ten_used |= (a==10);
            int e = 3*(n-1-pos) + !ten_used;
            if(act > 0) res = max(res, act + to_num(a,b,c)*exp_10[e]);
        }
        return res;
    }
    
    
    forr(a,out_first+1,2*n+1) if(!(mask & (1<<a))){
        int c = sum - a - last;
        if(c>=1 and c<=2*n and c != a and !(mask & (1<<c)) and c<10){
            ll act = f(mask + (1<<a) + (1<<c),out_first,in_first,c,pos+1,s);
            ten_used |= (a==10) || (c==10);
            int e = 3*(n-1-pos) + !ten_used;
            if(act > 0) res = max(res, act + to_num(a,last,c)*exp_10[e]);
        }
    }
    return res;
}


int main() {
    exp_10[0] = 1;
    forr(i,1,17) exp_10[i] = exp_10[i-1] * 10;
    
    cin >> n;
    
    max_sum = 2*(2*n+1) - (n+1)/2;
    min_sum = (2*n+1) + (n+1)/2;
        
    memset(dp,-1,sizeof dp);
    cout << f(0,0,0,0,0,0) << endl;    
    
    
    return 0;
}
