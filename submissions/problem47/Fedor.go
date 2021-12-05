package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"strconv"
	"strings"
)

func f(n, k, d, ld, m int) (r int) {
	if s[n][k] != -1 {
		return s[n][k]
	}
	defer func() {
		s[n][k] = r
	}()
	if n <= 0 {
		r = 0
		return 0
	}
	if n == 1 {
		if k > ld {
			r = 0
			return 0
		}
		r = d - (1 << k) + 1
		return r
	}
	for i := k; i <= ld; i++ {
		r += ((1 << i) * f(n-1, i+1, d, ld, m)) % m
		r = r % m
	}
	return r
}

func num(d, m int) int {
	ld := math.Ilogb(float64(d))
	r := 0
	s = make([][]int, ld+2)
	for i := range s {
		s[i] = make([]int, ld+2)
		for j := range s[i] {
			s[i][j] = -1
		}
	}
	for n := 1; n <= ld+1; n++ {
		r += (f(n, 0, d, ld, m) % m)
		r = r % m
	}
	return r
}

var s [][]int

func main() {
	s := bufio.NewScanner(os.Stdin)
	s.Scan()
	t, _ := strconv.Atoi(s.Text())
	for t > 0 {
		t--
		s.Scan()
		f := strings.Fields(s.Text())
		d, _ := strconv.Atoi(f[0])
		m, _ := strconv.Atoi(f[1])
		fmt.Println(num(d, m))
	}
}
