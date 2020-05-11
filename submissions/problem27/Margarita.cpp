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
typedef long double ld;
typedef pair<ll,ll> pll;
#define dforn(i,n) for(int i=n-1; i>=0; i--)
#define sz(x) ((int)((x).size()))

#define MAXS 2500

ld dp[1<<5][1<<5][5][5][2];
bool vis[1<<5][1<<5][5][5];

struct state {
  int lower, upper, x, y;
};

bool final_state(state st){
  return st.lower == 0 and __builtin_popcount(st.upper) == 4 and st.y == 4 and !(st.upper & (1<<st.x));
}

bool valid(int x, int y){
  return x >= 0 and x < 5 and y >= 0 and y < 5;
}

int dx[4] = {0,1,0,-1};
int dy[4] = {1,0,-1,0};

int cant_next[5][5];

int main() {
    
  ld res = 0;
  
  queue<state> Q[2];
  Q[0].push({(1<<5)-1,0,2,2});
  dp[(1<<5)-1][0][2][2][0] = 1;
  
  forn(x,5) forn(y,5){
    cant_next[x][y] = 0;
    forn(i,4) if(valid(x+dx[i], y+dy[i])) cant_next[x][y]++;
  }
  
  forn(s,MAXS-1){
    zero(vis);
    int bs = s&1;
    while(!Q[bs].empty()){
      state st = Q[bs].front(); Q[bs].pop();
      if(final_state(st)){ 
        res += s * dp[st.lower][st.upper][st.x][st.y][bs];
        continue;
      }  
      int next_lower = st.lower, next_upper = st.upper;
      if ((__builtin_popcount(st.lower) + __builtin_popcount(st.upper)) == 4 and st.y == 4 and !(st.upper & (1<<st.x))) next_upper |= (1<<st.x); 
      if ((__builtin_popcount(st.lower) + __builtin_popcount(st.upper)) == 5 and st.y == 0 and (st.lower & (1<<st.x))) next_lower -= (1<<st.x); 
      forn(i,4){
        int next_x = st.x + dx[i], next_y = st.y + dy[i];
        if(valid(next_x, next_y)){
          if(!vis[next_lower][next_upper][next_x][next_y]){
            Q[1-bs].push({next_lower,next_upper, next_x, next_y});
            vis[next_lower][next_upper][next_x][next_y] = true;
            dp[next_lower][next_upper][next_x][next_y][1-bs] = dp[st.lower][st.upper][st.x][st.y][bs]/cant_next[st.x][st.y];
          } else {
            dp[next_lower][next_upper][next_x][next_y][1-bs] += dp[st.lower][st.upper][st.x][st.y][bs]/cant_next[st.x][st.y];
          } 
        }
      }      
    }
  }  
    
  cout << fixed << setprecision(6) << res << endl;  
  return 0;
}
