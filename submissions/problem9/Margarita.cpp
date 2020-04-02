#include <bits/stdc++.h>
using namespace std;
#define forr(i,a,b) for(int i=(a); i<(b); i++)
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

vector<int> input;
vector<int> input_sorted;
vector<int> flips;
int pos[128];

int n;

void addFlip(int p){
    flips.pb(n-p);
    for(auto x: input) if(pos[x] <= p) 
        pos[x] = p - pos[x];
}


int main() {
    ll sum = 0;
    string line;
    while(getline(cin,line)){
        istringstream is(line);
        input.clear();
        input_sorted.clear();
        flips.clear();
        int x;
        while(is >> x){
            input.pb(x);
            input_sorted.pb(x);
        }
        
        sort(input_sorted.begin(), input_sorted.end());
        
        n = sz(input);
        
        forn(i, n) pos[input[i]] = i;
        
        dforn(i, n){
            int act = input_sorted[i];
            if(pos[act] == i) continue;
            if(pos[act] != 0) addFlip(pos[act]);
            addFlip(i);
        }
    
        for(auto x: input){
            cout << x << " ";
            sum += x;
        }
        cout << endl;

        for(auto x: flips){
            cout << x << " ";
            sum += x;
        }
        cout << 0 << endl;
    }
    
    cout << sum << endl;
    return 0;
}
