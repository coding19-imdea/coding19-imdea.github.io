package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"strconv"
	"strings"
)

func main() {
	s := bufio.NewScanner(os.Stdin)
	for s.Scan() {
		f := strings.Fields(s.Text())
		a, _ := strconv.Atoi(f[0])
		b, _ := strconv.Atoi(f[1])
		if a == b {
			fmt.Println(0)
		} else {
			fmt.Println(1<<(int32(math.Ilogb(float64(a^b)))+1) - 1)
		}
	}
}
