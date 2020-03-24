#include <iostream>
#include <vector>
using namespace std;


// v[i][j] contains the number of ways
// to change i pence using possibly up to the jth
// largest coin
int v[201][8];

int main(){
	// filling edges of table, just 1
	// way of producng 0p, also just 1
	// way of changing using only the 1p coin
	for (int j=0; j<8; j++) v[0][j]=1;
	for (int i=0; i<201; i++) v[i][0]=1;
	// filling rest of table, at each
	// point we get the chance to use or
	// not use the largest coin
	for(int i=1; i<201; i++){
		if (i - 2 >= 0) 
			v[i][1] += v[i-2][1] + v[i][0];
		else v[i][1] = v[i][0];
		if (i - 5 >= 0) 
			v[i][2] += v[i-5][2] + v[i][1];
		else v[i][2] = v[i][1];
		if (i - 10 >= 0) 
			v[i][3] += v[i-10][3] + v[i][2];
		else v[i][3] = v[i][2];
		if (i - 20 >= 0) 
			v[i][4] += v[i-20][4] + v[i][3];
		else v[i][4] = v[i][3];
		if (i - 50 >= 0) 
			v[i][5] += v[i-50][5] + v[i][4];
		else v[i][5] = v[i][6];
		if (i - 100 >= 0) 
			v[i][6] += v[i-100][6] + v[i][5];
		else v[i][6] = v[i][5];
		if (i - 200 >= 0) 
			v[i][7] = v[i-200][7] + v[i][6];
		else v[i][7] = v[i][6];
	}
	cout << v[200][7] << endl;
	return 0;
}


