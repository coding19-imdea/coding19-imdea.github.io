#include <iostream>
#include <vector>
#include <map>
#include <set>
#include <queue>
#include <stack>
#include <algorithm>
#include <string>
#include <cstring>


using namespace std;

typedef long long ll;
typedef pair<int, int> ii;
typedef vector<int> vi;
typedef vector<ii> vii;
typedef vector<vi> vvi;
typedef map<int, int> mii;

typedef pair<ii, int> guess;

int board[9][9];

bool is_valid(int r, int c, int n){
	int R = r/3;
	int C = c/3;
	for(int i=0; i<9; i++){
		if(board[r][i]==n) return false;
		if(board[i][c]==n) return false;
		if(board[3*R+i/3][3*C+i%3]==n) return false;
	}

	return true;
}


void read_board(){
	string str;
	for(int i=0; i<9; i++){
		getline(cin,str);
		for(int j=0; j<9; j++) board[i][j] = str[j]-'0';
	}
}

void print_board(){
	for(int i=0; i<9; i++){
		for(int j=0; j<9; j++){
			cout << board[i][j];}
		cout << endl;
	}
}

bool solve(int r, int c){
	if (r>8)
		return true;
	else if (board[r][c]==0){
		for(int i=1; i<=9; i++){
			if (is_valid(r,c,i)){
				board[r][c]=i;
				if (solve(r+(c+1)/9, (c+1)%9)) return true;
			}
		}
		board[r][c]=0;
		return false;
	}
	else return solve(r+(c+1)/9, (c+1)%9);
}


int main(){
	int sum=0, t=0;
	string str;
	while(getline(cin,str)){
		read_board();
		if (solve(0,0)){
			sum+= 100*board[0][0]+10*board[0][1]+board[0][2];
			cout << "Grid " << ++t << endl;
			print_board();
		}
	}
	cout << sum << endl;
	return 0;
}
