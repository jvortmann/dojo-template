
def dot_product(a, b):
    if len(a) != len(b):
        raise ValueError('length of arrays mismatch')

    if len(a) == 0 or len(b) == 0:
        raise ValueError('arrays can not be empty')

    return sum((item_a * item_b for (item_a, item_b) in zip(a, b)))


def break_lines(phrase, column_length=20):
    words = phrase.split(' ')
    phrase_length = 0
    current_phrase = ''

    for word in words:
        phrase_length += len(word) + 1

        if (phrase_length >= column_length):
            current_phrase = current_phrase.strip()
            current_phrase += '\n'
            phrase_length = len(word) + 1

        current_phrase += word + ' '

    return current_phrase.strip()
