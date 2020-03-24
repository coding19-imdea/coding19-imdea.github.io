#include <bits/stdc++.h>

using namespace std;


array<int, 8> coins = {1, 2, 5, 10, 20, 50, 100, 200};

int main()
{
	int N = 200;

	vector<long long> ways(N+1, 0);
	ways[0] = 1;

	for (auto coin : coins) {
		for (auto value = coin; value <= N; value++) {
			ways[value] += ways[value-coin];
		}
	}

	//for (auto way : ways) cout << way << endl;

	cout << endl << ways[N] << endl;
}
