package dojo

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetElementIndexReturnsMinusOneWhenMissingElement(t *testing.T) {
	result := getElementIndex([]int{3, 1, 2}, 4)
	assert.Equal(t, result, -1)
}

// func TestGetElementIndexReturnsTheIndexOfTheElementWhenFound(t *testing.T) {
// 	result := getElementIndex([]int{3, 1, 2}, 1)
// 	assert.Equal(t, result, 1)
// }

func TestGetRotationOffsetReturnsZeroWhenNoRotation(t *testing.T) {
	result := getRotationOffset([]int{1, 2, 3})
	assert.Equal(t, result, 0)
}

func TestGetRotationOffsetReturnsCorrectOffsetWhenRotated(t *testing.T) {
	assert.Equal(t, getRotationOffset([]int{4, 1, 2, 3}), 1)
	assert.Equal(t, getRotationOffset([]int{3, 4, 1, 2}), 2)
	assert.Equal(t, getRotationOffset([]int{2, 3, 4, 1}), 3)
}

func TestBinarySearchReturnsOneForOrderedArray(t *testing.T) {
	assert.Equal(t, binarySearch([]int{1, 2, 3}, 0, 1), 0)
}
