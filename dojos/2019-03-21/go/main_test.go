package main

import (
	"testing"
)

func compareNumbers(actual, expected int, t *testing.T) {
	if actual != expected {
		t.Errorf("Got %v, expected %v", actual, expected)
	}
}

func compareSlices(actual, expected []int, t *testing.T) {
	compareNumbers(len(actual), len(expected), t)

	for i := range actual {
		compareNumbers(actual[i], expected[i], t)
	}
}

func TestGetDivisorsWith6(t *testing.T) {
	actual := getDivisors(6)
	expected := []int{1, 2, 3}
	compareSlices(actual, expected, t)
}

func TestGetDivisorsWith100(t *testing.T) {
	actual := getDivisors(100)
	expected := []int{1, 2, 4, 5, 10, 20, 25, 50}
	compareSlices(actual, expected, t)
}

func TestSumNumbers(t *testing.T) {
	actual := sumNumbers([]int{1, 2, 3, 4, 5})
	expected := 15
	compareNumbers(actual, expected, t)
}

func TestSumAmicableNumbers(t *testing.T) {
	actual := sumAmicableNumbers(300)
	expected := 220 + 284
	compareNumbers(actual, expected, t)
}

func TestSumAmicableNumbersFor10000(t *testing.T) {
	actual := sumAmicableNumbers(10000)
	expected := 220 + 284 + 1184 + 1210 + 2620 + 2924 + 5020 + 5564 + 6232 + 6368
	compareNumbers(actual, expected, t)
}
