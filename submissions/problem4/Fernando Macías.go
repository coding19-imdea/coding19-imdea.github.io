package main

import (
	"fmt"
  "strings"
)

var keylog = [...]string {
  "319",
  "680",
  "180",
  "690",
  "129",
  "620",
  "762",
  "689",
  "762",
  "318",
  "368",
  "710",
  "720",
  "710",
  "629",
  "168",
  "160",
  "689",
  "716",
  "731",
  "736",
  "729",
  "316",
  "729",
  "729",
  "710",
  "769",
  "290",
  "719",
  "680",
  "318",
  "389",
  "162",
  "289",
  "162",
  "718",
  "729",
  "319",
  "790",
  "680",
  "890",
  "362",
  "319",
  "760",
  "316",
  "729",
  "380",
  "319",
  "728",
  "716"}

func main() {
	var nums map[string]bool = make(map[string]bool)
	for _, log := range keylog {
		for _, num := range log {
			nums[string(num)] = false
		}
	}	

	psw := []string{}
	for len(psw) < len(nums) {
		var num string
		var found bool
		for num, found = range nums {
			if !found {
				break
			}
		}
		
		isFirst := true
		for _, log := range keylog {
			if strings.Index(log, num) > 0 { // Present, but not first
				isFirst = false
				break
			}
		}
		if isFirst {
			fmt.Print(num)
			psw = append(psw, num)
			for i, log := range keylog {
				keylog[i] = strings.Replace(log, num, "", -1)
			}
			nums[num] = true
		}
	}
	fmt.Println()
}

