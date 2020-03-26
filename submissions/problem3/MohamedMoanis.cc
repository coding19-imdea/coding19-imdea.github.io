#include <bits/stdc++.h>

using namespace std;


class VirusSim {
public:
	int operator()(const vector<string>& Cs, const vector<string>& Ds, const string& N) {
		for (auto& C : Cs) {
			combine[C[0]][C[1]] = C[2];
			combine[C[1]][C[0]] = C[2];
		}

		for (auto& D : Ds) {
			opposite[D[0]].insert(D[1]);
			opposite[D[1]].insert(D[0]);
		}

		for (auto& n : N) {
			char current = n;
			bool clear = false;

			//cerr << "-->Current = " << current << endl;

			// Combine
			while (!result.empty()) {
				char last = result.back();

				// they can appear in both orders left-right
				if (combine.count(current) == 1) {
					if (!reduce(current, last, current)) break;
				} else if (combine.count(last) == 1) {
					if (!reduce(last, current, current)) break;
				} else {
					break;
				}
			}

			// Eliminate
			for (auto& opp : opposite[current]) {
				if (seen.count(opp) == 1 && seen[opp] > 0) {
					//cerr << "Eliminate " << current << " because " << opp << endl;
					clear = true;
					break;
				}
			}


			if (clear) {
				seen.clear();
				result.clear();
			} else {
				//cerr << "Inserted " << current << endl;
				seen[current]++;
				result.push_back(current);
			}
		}

		return result.size();
	}

	void print() {
		cout << '[';
		for (auto i = 0; i < result.size(); i++) {
			cout << result[i];
			if (i + 1 < result.size()) cout << ", ";
		}
		cout << ']';
	}

private:
	bool reduce(char current, char last, char& r)
	{
		if (combine[current].count(last) == 1) {
			r = combine[current][last];
			//cerr << "Reduced " << current << " with " << last << " by " << r << endl;

			seen[result.back()]--;
			if (seen[result.back()] == 0) seen.erase(result.back());

			result.pop_back();
			return true;
		}

		return false;
	}

	unordered_map<char, unordered_map<char, char>> combine;
	unordered_map<char, unordered_set<char>> opposite;
	unordered_map<char, int> seen;
	vector<char> result;
};

int main()
{
	int T, tmp, M = 0;
	cin >> T;

	for (int i = 1; i <= T; i++) {
		vector<string> Cs, Ds;
		string N;

		cin >> tmp;
		while (tmp-- > 0) {
			cin >> N;
			Cs.emplace_back(move(N));
		}

		cin >> tmp;
		while (tmp-- > 0) {
			cin >> N;
			Ds.emplace_back(move(N));
		}


		cin >> tmp >> N;

		VirusSim sim;
		M += sim(Cs, Ds, N);

		cout << "Case #" << i << ' ';
		sim.print();
		cout << endl;
	}

	cout << M << endl;
}
