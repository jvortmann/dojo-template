cycle_length_cache = {}


def cycle_length(n):
    cycle_length = 1

    while n != 1:
        if cycle_length_cache.get(n):
            cycle_length = cycle_length_cache[n] + cycle_length
            break

        cycle_length += 1

        if n % 2 == 0:
            n = n / 2
        else:
            n = 3 * n + 1

    cycle_length_cache[n] = cycle_length

    return cycle_length

def max_cycle_length(i, j):
    max_cycle_length = 0

    inputs = [i, j]
    inputs.sort()

    for number in range(inputs[0], inputs[1] + 1):
        current_cycle_length = cycle_length(number)

        if current_cycle_length > max_cycle_length:
            max_cycle_length = current_cycle_length

    return max_cycle_length

def max_cycle_length_by_user_input(user_input):
    input = user_input.split()

    result = max_cycle_length(int(input[0]), int(input[1]))

    return f'{user_input.strip()} {result}'


# it executes what is inside `main` when running
# this script: python main.py
if __name__ == "__main__":
    try:
        while True:
            print(max_cycle_length_by_user_input(input()))
    except Exception:
        pass
