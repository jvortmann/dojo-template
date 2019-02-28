# types are optional
def anagrama(word):
    resp = []
    resp.append(word)

    result = word[::-1]
    if not result in resp:
        resp.append(result)

    return sorted(resp)
