#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <errno.h>
#include <limits.h>
#include <stdint.h>
#include <time.h>


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
	uint64_t d = strtol(argv[1], &p, 10);
  if (errno != 0 || *p != '\0' || d > pow(10, 9) +1.0 || d < 1) {
		fprintf(stderr, "Invalid inputs \n");
		return -1;
  }
	uint64_t m = strtol(argv[2], &p, 10);
	if (errno != 0 || *p != '\0' || m >  pow(10, 9) + 1.0 || m < 1) {
		fprintf(stderr, "Invalid inputs \n");
	 	return -1;
	}
	uint64_t *numseq;
	numseq = malloc(d * sizeof(uint64_t));
	numseq[0] = 1%m;
	uint64_t i;
	for (i=1; i< d; i++)
	{
		int n = floor(log(i + 1) / log(2));
		uint64_t y = (uint64_t) ( pow(2, n) -1.0);
    uint64_t x = numseq[i-1] + numseq[y-1] + 1;
		numseq[i] = x%m;
	}
	fprintf(stderr, "%llu\n", numseq[d-1]);
	return 0;
}
