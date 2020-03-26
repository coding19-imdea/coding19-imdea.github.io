#include <iostream>
#include <vector>
#include <map>
#include <set>
#include <queue>
#include <stack>
#include <algorithm>
#include <string>


using namespace std;

typedef long long ll;
typedef pair<int, int> ii;
typedef vector<int> vi;
typedef vector<ii> vii;
typedef vector<vi> vvi;
typedef map<int, int> mii;


int main(){
	int T;
	int S=0;
	cin >> T;
	for(int r = 1; r <= T; r++){
		int C, D, N;
		vector <vi> comb(256, vi(256,-1));
		vvi opp(256);
		vi cnt(256, 0);
		cin >> C;
		while(C--){
			string s1;
			cin >> s1;
			comb[s1[0]][s1[1]] = s1[2];
			comb[s1[1]][s1[0]] = s1[2];
		}
		cin >> D;
		while (D--){
			string s2;
			cin >> s2;
			opp[s2[0]].push_back(s2[1]);
			opp[s2[1]].push_back(s2[0]);

		}
		cin >> N;
		string in;
		cin >> in;
		vector<char> out;
		cnt[in[0]]++;
		out.push_back(in[0]);
		for (int k=1; k<in.size(); k++){
			char c = in[k];
			if (!out.empty() && comb[c][out.back()]!=-1){
				cnt[out.back()]--;
				cnt[comb[c][out.back()]]++;
				out[out.size()-1] = comb[c][out.back()];
			}
			else{
				cnt[c]++;
				out.push_back(c);

				for(vi::iterator it = opp[c].begin();
						it < opp[c].end(); it++){
					if (cnt[*it]>0){
					//clear everything
						out.clear();
						for(vi::iterator jt = 
								cnt.begin(); 
								jt < cnt.end(); 
								jt++)
						*jt=0;
					}
				}
			}

		}
		S += out.size();
		cout << "Case #" << r << ": [";
		if (out.size()>0){
			cout << out[0];
			for (int l=1; l<out.size(); l++)
				cout << ", " << out[l];
		}
		cout << "]" << endl;
	}
	cout << S << endl;
	return 0;
}
