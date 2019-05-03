def main():
    try:
        line = input()
        while(line):
            num1, num2 = line.split()
            start = min(num1, num2)
            end = max(num1, num2)
            max_cycle = max_cycle_length(int(start), int(end))
            print(num1, num2, max_cycle)
            line = input()

    except EOFError as error:
        pass

def max_cycle_length(start, end):
    max_cycle = 0

    for num in range(start, end+1):
        cycles = cycle_length(num)
        max_cycle = cycles if cycles > max_cycle else max_cycle

    return max_cycle

    
def cycle_length(num):
    count = 1

    while num != 1:

        if num%2 == 0:
            num = num/2
        else:
            num = num * 3 + 1

        count += 1

    return count

main()