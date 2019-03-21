package main

import "fmt"

func main() {
	finalSum := sumAmicableNumbers(10000)
	fmt.Printf("And the final sum is... %d\n", finalSum)
}

func getDivisors(number int) []int {
	result := []int{}

	for i := 1; i < number; i++ {
		if number%i == 0 {
			result = append(result, i)
		}
	}

	return result
}

func sumNumbers(numbers []int) int {
	sum := 0
	for _, number := range numbers {
		sum += number
	}
	return sum
}

func sumAmicableNumbers(limit int) int {
	memoizedResults := make(map[int]int)
	amicableNumbers := make([]int, 0)

	for i := 1; i < limit; i++ {
		divisors := getDivisors(i)
		sum := sumNumbers(divisors)
		memoizedResults[i] = sum
		amicableSum, exists := memoizedResults[sum]
		if !exists || i == sum {
			continue
		}

		if amicableSum == i {
			amicableNumbers = append(amicableNumbers, sum, i)
		}
	}

	return sumNumbers(amicableNumbers)
}
