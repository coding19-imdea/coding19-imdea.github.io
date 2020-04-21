#include <bits/stdc++.h>
using namespace std;
#define forr(i,a,b) for(ll i=(a); i<(b); i++)
#define forn(i,n) forr(i,0,n)
#define zero(v) memset(v, 0, sizeof(v))
#define forall(it,v) for(auto it=v.begin();it!=v.end();++it)
#define pb push_back
#define fst first
#define snd second
#define pos first
#define b second
typedef long long ll;
typedef pair<ll,ll> pll;
#define dforn(i,n) for(int i=n-1; i>=0; i--)
#define sz(x) ((int)((x).size()))

typedef pair<int,char> card;
#define value first
#define suit second

int r[2];
vector<int> info[2];

vector<card> hand[2];

void get_rank(int n){
    sort(hand[n].begin(), hand[n].end());
    
    bool same_suit = true;
    forr(i,1,5) if(hand[n][i].suit != hand[n][i-1].suit) same_suit = false;
    
    bool straight = true;
    forr(i,1,5) if(hand[n][i].value != hand[n][i-1].value + 1){
        if(i == 4 and hand[n][i].value == 14 and hand[n][0].value == 2) continue;
        straight = false;
    }
    
    if(straight and same_suit){
        if(hand[n][4].value == 14 and hand[n][0].value != 2){
            r[n] = 10;
            info[n].clear();
        } else {
            r[n] = 9;    
            if(hand[n][0].value == 2 and hand[n][4].value == 14) info[n] = {5};
            else info[n] = {hand[n][4].value};
        }
        return;
    }
    
    bool poker = false;
    forn(i,2) if(hand[n][i].value == hand[n][i+3].value) poker = true;
    if(poker){
        r[n] = 8;
        info[n] = {hand[n][2].value};
        return;
    }
    
    bool full = hand[n][0].value == hand[n][1].value and hand[n][3].value == hand[n][4].value and (hand[n][2].value == hand[n][3].value or hand[n][2].value == hand[n][1].value);
    if(full){
        r[n] = 7;
        info[n] = {hand[n][2].value};
        return;
    }
    
    if(same_suit){
        r[n] = 6;
        info[n].clear();
        for(auto c: hand[n]) info[n].pb(c.value);
        reverse(info[n].begin(), info[n].end());
        return;
    }
    
    if(straight){
        r[n] = 5;
        if(hand[n][0].value == 2 and hand[n][4].value == 14) info[n] = {5};
        else info[n] = {hand[n][4].value};
        return;
    }
    
    bool three = false;
    forn(i,3) if(hand[n][i].value == hand[n][i+2].value) three = true;
    if(three){
        r[n] = 4;
        info[n] = {hand[n][2].value};
        return;
    }
    
    vector<int> pairs;
    forn(i,4) if(hand[n][i].value == hand[n][i+1].value) pairs.pb(hand[n][i].value);
    if(sz(pairs) == 2){
        r[n] = 3;
        info[n] = pairs;
        reverse(info[n].begin(), info[n].end());
        info[n].pb(hand[n][0].value ^ hand[n][1].value ^ hand[n][2].value ^ hand[n][3].value ^ hand[n][4].value);
        return;
    }
    if(sz(pairs) == 1){
        r[n] = 2;
        info[n].clear();
        for(auto x: hand[n]) if(x.value != pairs[0]) info[n].pb(x.value);
        info[n].pb(pairs[0]);
        reverse(info[n].begin(), info[n].end());
        return;
    }
    r[n] = 1;
    info[n].clear();
    for(auto c: hand[n]) info[n].pb(c.value);
    reverse(info[n].begin(), info[n].end());
}

int main() {
    string line;
    ll res = 0;
    while(getline(cin, line)){
        istringstream is(line);
        zero(hand);
        forn(i,10){
            string s; is >> s;
            int v;
            if(s[0] == 'T') v = 10;
            else if(s[0] == 'J') v = 11;
            else if(s[0] == 'Q') v = 12;
            else if(s[0] == 'K') v = 13;
            else if(s[0] == 'A') v = 14;
            else v = s[0] - '0';
            hand[i/5].pb({v,s.back()});
        }
        get_rank(0);
        get_rank(1);
        if(r[0] > r[1]) res++;
        else if(r[0] == r[1] and info[0] > info[1]) res++;
    }
    cout << res << endl;
    return 0;
}
