import sys


def collatz_sequence(n):

    sequence = [n]

    while n != 1:
        if n % 2 == 0:
            n = n / 2
        else:
            n = 3 * n + 1

        sequence.append(n)

    return sequence

def max_sequence(i, j):
    max_len = 0

    for n in range(i, j + 1):
        len_sequence = len(collatz_sequence(n))

        if len_sequence > max_len:
            max_len = len_sequence

    return max_len

def converter(line):
    return tuple((int(v) for v in line.split()))

def process_input(data):
    return (converter(line) for line in data)
    
data = sys.stdin.readlines()
processed = process_input(data)

for (i, j) in processed:
    max_len = max_sequence(i, j)
    print(i, j, max_len)
