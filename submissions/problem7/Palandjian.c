// compile with gcc -Wextra -Wall -O3 palandjian.c
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

int n = 1000000000;

int reverse(int a) {
  int b = 0;
  while (a != 0) {
    b = b * 10 + a % 10;
    a /= 10;
  }
  return b;
}

bool is_only_odd(int a) {
  while (a != 0) {
    if (a % 2 == 0)
      return false;
    a /= 10;
  }
  return true;
}

int main(void) {
  int cpt = 0;
  for(int i = 11; i <= n; ++i) {
    if (i % 10 == 0)
      continue;
    cpt += is_only_odd(i + reverse(i));
  }
  printf("There are %d reversible numbers below %d.\n", cpt, n);
  return EXIT_SUCCESS;
}
