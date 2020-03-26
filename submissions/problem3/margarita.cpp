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

map<pair<char,char>, char> combination;
map<char, vector<char>> opposites;

vector<char> output;
map<char, int> virus_count;

void printOutput(){
    cout << "[";
    forn(i,sz(output)){
        if(i) cout << ", ";
        cout << output[i];
    }
    cout << "]" << endl;
}

void addVirus(char c){
    output.pb(c);
    virus_count[c]++;
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    int T; cin >> T;
    int M = 0;
    forn(caso, T){
        int c,d,n;
        cin >> c;
        forn(_,c){
            string s;
            cin >> s;
            combination[{s[0],s[1]}] = combination[{s[1],s[0]}] = s[2];
        }
        cin >> d;
        forn(_,d){
            string s; cin >> s;
            opposites[s[0]].pb(s[1]);
            opposites[s[1]].pb(s[0]);
        }
        cin >> n;
        string s; cin >> s;
        forn(i,n){
            if(!output.empty()){
                char last = output.back();
                if(combination.find({last,s[i]}) != combination.end()){
                    output.pop_back();
                    virus_count[last]--;
                    char new_virus = combination[{last, s[i]}]; 
                    addVirus(new_virus);        
                } else{
                    bool opposite_active = false;
                    for(auto &o : opposites[s[i]])
                        if(virus_count[o] > 0){
                            opposite_active = true;
                            break;
                        }
                    if(opposite_active){        
                        output.clear();
                        virus_count.clear();
                    } 
                    else addVirus(s[i]);
                }    
            } else {
                addVirus(s[i]);
            }
        }
        
        cout << "Case #" << caso + 1 << ": "; printOutput(); 
        M += output.size();
        opposites.clear();
        combination.clear();
        output.clear();
        virus_count.clear();
    }
    cout << M << endl;
    
    return 0;
}
