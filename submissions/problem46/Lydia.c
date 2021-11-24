#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <errno.h>
#include <limits.h>
#include <stdint.h>
#include <time.h>


int maxxor(uint64_t l, uint64_t r) {
	if (l < 0 || r < 0) {
		fprintf(stderr, "error\n");
		return -1;
	}
	if (l == 0) {
		if (r ==0){
		fprintf(stderr, "0\n");
		return 0;
		}
	}
	int len_l;
	int len_r;
	if (l != 0){
		len_l =  (int)(floor(log(l) / log(2)) + 1);
	} else{
		len_r = (int)(floor(log(r) / log(2)) + 1);
		uint64_t output = pow(2, len_r) -1;
		fprintf(stderr, "%llu\n", output);
		return 0;
	}
	if (r != 0){
		len_r = (int)(floor(log(r) / log(2)) + 1);
	} else{
		len_l = (int)(floor(log(l) / log(2)) + 1);
		uint64_t output = pow(2, len_l) -1;
		fprintf(stderr, "%llu\n", output);
		return 0;
	}

	if (len_l == len_r) {
		uint64_t lnew = l - pow(2, len_l -1) ;
		uint64_t rnew = r - pow(2, len_r -1);
		maxxor(lnew, rnew);
	} else{
		if (len_l > len_r){
			uint64_t output = pow(2, len_l) -1;
			fprintf(stderr, "%llu\n", output);
			return 0;
		} else{
			uint64_t output = pow(2, len_r);
			output = output -1;
			fprintf(stderr, "%llu\n", output);
			return 0;
		}
	}
}


int main(int argc, char *argv[]) {
	if (argc < 3){
		fprintf(stderr, "Not enough inputs detected \n");
		return -1;
	}
	if (argc >  3){
		fprintf(stderr, "Too many inputs detected \n");
		return -1;
	}
	char *p;
	errno = 0;
	uint64_t l = strtol(argv[1], &p, 10);
  if (errno != 0 || *p != '\0' || l > pow(10, 18) +1 || l < 1) {
		fprintf(stderr, "Invalid inputs \n");
		return -1;
  }
	uint64_t r = strtol(argv[2], &p, 10);
	if (errno != 0 || *p != '\0' || r >  pow(10, 18) + 1 || r < 1) {
		fprintf(stderr, "Invalid inputs \n");
	 	return -1;
	}


	int res = maxxor(l,r);
	return res;
}
