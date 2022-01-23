package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"strconv"
	"strings"
)

func res(n, m int) int {
	s, t := 0, 0
	r := make([]int, n+1)

	for i := 2; i <= n; i++ {
		r[i] = (i/2 + i%2 + 1 + s) % m
		sr := int(math.Sqrt(float64(i)))
		for j := 2; j <= sr; j++ {
			if i%j == 0 {
				t = (t + r[j]%m) % m
				t = ((t - r[j-1]%m) + m) % m
				if k := i / j; k > sr {
					t = (t + r[k]%m) % m
					t = ((t - r[k-1]%m) + m) % m
				}
			}
		}
		r[i] = (r[i] + t) % m
		s = (s + r[i]%m) % m
	}

	return r[n]
}

func main() {
	s := bufio.NewScanner(os.Stdin)
	s.Scan()
	f := strings.Fields(s.Text())
	n, _ := strconv.Atoi(f[0])
	m, _ := strconv.Atoi(f[1])
	fmt.Println(res(n, m))
}
