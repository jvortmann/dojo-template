special_names = {
    "FILHA",
    "FILHO",
    "JUNIOR",
    "NETA",
    "NETO",
    "SOBRINHA",
    "SOBRINHO",
}

def abntify_name(name):

    parts = name.split(' ')

    if len(parts) == 1:
        return name.upper()

    last_part = parts[-1:]
    first_part = parts[:-1]

    if len(parts) >= 3 and parts[-1].upper() in special_names:
        last_part = parts[-2:]
        first_part = parts[:-2]

    first_part = ' '.join(first_part)
    last_part = ' '.join(last_part)

    return f'{last_part.upper()}, {first_part}'
