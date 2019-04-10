def divide_coins(coins):
    return divide_coins_by_n(coins, 2)

def divide_coins_by_n(coins, n):
    people_coins = [0 for _ in range(n)]

    coins.sort(reverse=True)

    fair_share = sum(coins)/n

    for coin in coins:
        i = find_first_which_fits(people_coins, coin, fair_share)
        if i is None:
            i = find_poorest(people_coins)
        people_coins[i] += coin

    return max(people_coins) - min(people_coins)

def find_first_which_fits(people_coins, coin, fair_share):
    for index, person_coins in enumerate(people_coins):
        if person_coins + coin <= fair_share:
            return index
    return None

def find_poorest(people_coins):
    min_coins = min(people_coins)
    return people_coins.index(min_coins)
