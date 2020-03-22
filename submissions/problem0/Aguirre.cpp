#include<iostream>

using namespace std;

// Find a*b where n^2 + an + b
// produces the most consecutive primes
// starting at n=0, and |a|<1000, |b|<=1000



// Prime checker
bool chkPrime(int n){
	if (n<=1) return false;
	if (n==2) return true;
	int d = 3;
	while(d*d<=n){
		if (n%d==0) return false;
		d+=2;
	}
	return true;
}




int main(){
	int max=-1, prod=0;
	
	//iterate over a,b
	for (int a=-999; a<1000; a++){
		for (int b=3; b<1000; b+=2){
			//b must be prime
			//iterate over the quadratic
			int n=0;
			while(chkPrime(n*n+a*n+b)) n++;
			//check against the max
			if (n>max){
				prod=a*b;
				max = n;
			}
		}
	}
	cout << prod << endl;
	return prod;
}
