
def dot_product(a, b):
    if len(a) != len(b):
        raise ValueError('length of arrays mismatch')

    if len(a) == 0 or len(b) == 0:
        raise ValueError('arrays can not be empty')

    return sum((item_a * item_b for (item_a, item_b) in zip(a, b)))
