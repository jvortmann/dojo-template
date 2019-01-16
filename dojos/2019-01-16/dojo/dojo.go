package dojo

func getRotationOffset(array []int) int {
	for i := 0; i < len(array)-1; i++ {
		if array[i] > array[i+1] {
			return i + 1
		}
	}
	return 0
}

func binarySearch(array []int, offset int, element int) int {
	return 0
}

func getElementIndex(array []int, element int) int {

	return -1
}
