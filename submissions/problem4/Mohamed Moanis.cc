#include <bits/stdc++.h>

using namespace std;

vector<string> input;
vector<char> passcode;

void parse_input()
{
	unordered_set<char> seen;	
	string s;

	while (cin >> s) {
		for(auto &c : s) seen.insert(c);
		input.emplace_back(move(s));
	}

	for (auto &c : seen) passcode.push_back(c);
}

void bubble_sort()
{
	for (auto &in : input) {
		auto i = -1, j = -1, k = -1;

		for (auto z = 0; z < passcode.size(); z++) {
			if (passcode[z] == in[0]) i = z;
			else if (passcode[z] == in[1]) j = z;
			else if (passcode[z] == in[2]) k = z;
		}

		assert(i != -1 && j != -1 && k != -1);

		if (i < j && k < j) swap(passcode[k], passcode[j]);
		else if (j < i && i < k) swap(passcode[j], passcode[i]);
		
		// first cases were sufficient
		else if (j < k && k < i) { swap(passcode[j], passcode[k]); swap(passcode[j], passcode[i]); }
		else if (k < i && i < j) { swap(passcode[k], passcode[i]); swap(passcode[i], passcode[j]); }
		else if (k < j && j < i) swap(passcode[k], passcode[i]);
	}
}

void verify_solution()
{
	for (auto &in : input) {
		auto i = -1, j = -1, k = -1;

		for (auto z = 0; z < passcode.size(); z++) {
			if (passcode[z] == in[0]) i = z;
			else if (passcode[z] == in[1]) j = z;
			else if (passcode[z] == in[2]) k = z;
		}

		assert(i < j && j < k);
	}

	cout << "Solution: ";
	for (auto &p : passcode) cout << p;
	cout << endl;
}

int main()
{
	parse_input();
	bubble_sort();
	verify_solution();
}
