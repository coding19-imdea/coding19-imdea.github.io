package main

import "fmt"

// The key to this solution is that, if the leading bits of l and r
// match in binary representation, they can be discarded since those
// will always XOR to 0s for any a and b. For the remaining bits, we
// can always find two numbers where they all XOR to 1. Example:
// l = 20 (10100), r = 22 (10110) -> a = 21 (10101), b = 22 (10110) -> result = 3 (00011)

// For numbers that do not have the same "length", we can always get a
// number with as many ones as bits in the "longest" number

func main() {
	var l, r uint64
	fmt.Scanf("%d %d", &l, &r)

	lbits := numBits(l)
	rbits := numBits(r)
	var nbits uint64 // Max number of bits that could yield ones after XOR
	
	// If binary values have same length, get rid of leading, matching bits
	if lbits == rbits {
		nbits = lbits
		mask := uint64(1 << nbits) // Mask for most significant bit
		for nbits > 0 {
			mask >>= 1
			if l & mask != r & mask {
				break
			}
			// Get rid of most significant bit on both numbers if it matches
			l ^= mask;
			r ^= mask;
			nbits--
		}
	} else if lbits > rbits {
		nbits = lbits
	} else {
		nbits = rbits
	}	
	
	// Calculate binary number with maximum amount of ones (2^nbits - 1)
	fmt.Printf("%d\n", (1 << nbits) - 1)
}

// Calculates "length" of the binary representation, counting from the most significant 1
func numBits(n uint64) uint64 {
	nbits := uint64(0)
	for n > 0 {
		n >>= 1
		nbits++
	}
	return nbits
}
