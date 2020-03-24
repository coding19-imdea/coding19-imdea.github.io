package main

import (
	"fmt"
)

var coinValues = [...]int {1, 2, 5, 10, 20, 50, 100, 200}
const targetValue = 200

func main() {
	combinations := addCoin(0, make([]int, 0), 0)
	fmt.Printf("Different combinations: %d\n", combinations)
}

func addCoin(currentSum int, usedValues []int, lastUsed int) int {
	combinations := 0
	for _, coin := range coinValues {
		// Check only sorted sequences to avoid repetitions
		if coin < lastUsed {
			continue
		}
		newUsedValues := append(usedValues, coin)
		newSum := currentSum + coin
		if newSum  < targetValue {
			combinations += addCoin(newSum, newUsedValues, coin)
		} else if newSum == targetValue {
			// fmt.Printf("Found: %v\n", newUsedValues)
			return combinations + 1
		}
	}
	return combinations
}
