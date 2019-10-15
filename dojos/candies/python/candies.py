#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the candies function below.
def candies(n, arr):
    candy = [1]*n

    for i in range(0, n-1):
        left = i
        right = left + 1

        if arr[right] > arr[left]:
            candy[right] = candy[left] + 1


    for i in range(0, n-1):
        left = n - (i + 2)
        right = left + 1

        if arr[left] > arr[right] and candy[left] <= candy[right]:
            candy[left] = candy[right] + 1

    return sum(candy)

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    n = int(input())

    arr = []

    for _ in range(n):
        arr_item = int(input())
        arr.append(arr_item)

    result = candies(n, arr)

    fptr.write(str(result) + '\n')

    fptr.close()
