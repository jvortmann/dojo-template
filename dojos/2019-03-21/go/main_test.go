package main

import (
	"testing"
)

func TestReturn1(t *testing.T) {
	result := return1()
	expected := 1

	if result != expected {
		t.Errorf("Got %d, expected %d", result, expected)
	}
}
