import sys

def parse_hotels(num_hotels, data):
    for i in range(num_hotels):
        hotel_data = data[i*2:(i*2) + 2]
        print('Hotel data {}: '.format(i))
        print(hotel_data)

data = sys.stdin.readlines()

participants, budget, hotels, weeks = data[0].split()

print("PARSED")

print(participants)
print(budget)
print(hotels)
print(weeks)

hotels = parse_hotels(int(hotels), data[1:])
