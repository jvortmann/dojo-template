def build_statistics(values):
    if not isinstance(values, list):
        raise TypeError

    if len(values) == 0:
        raise ValueError

    min_value = values[0]
    max_value = values[0]
    count = 0
    sum = 0

    for value in values:
        if not isinstance(value, (int, float)):
            raise TypeError

        if value < min_value:
            min_value = value
        if value > max_value:
            max_value = value
        count += 1
        sum += value

    return {
        'min': min_value,
        'max': max_value,
        'length': count,
        'average': sum / count
    }
