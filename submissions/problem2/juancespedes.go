package main

import (
	"fmt"
	"os"
	"strconv"
)

var coins = []int{
	200, 100, 50, 20, 10, 5, 2, 1,
}

func calc(total int, array []int, index int) int {
	// fmt.Printf("calc(%d,%v,%d)\n", total, array, index)
	if total == 0 {
		// fmt.Printf("solution: %v\n", array)
		return 1
	}
	ways := 0
	for i := index; i < 8; i++ {
		if total >= coins[i] {
			array[i]++
			ways += calc(total-coins[i], array, i)
			array[i]--
		}
	}
	return ways
}

func main() {
	n := 200
	var err error
	if len(os.Args) == 2 {
		n, err = strconv.Atoi(os.Args[1])
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
	}
	ways := calc(n, []int{0,0,0,0,0,0,0,0}, 0)
	fmt.Println(ways)
}
