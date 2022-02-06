
#This tiny programm counts the rate of natural increase

def rateOfNaturalIncrease (birth_rate: int, death_rate: int, population: int, per_mille = 1000) -> int:
    r = ((birth_rate - death_rate) / population) * per_mille
    return r



birth_rate = int(input('Enter the birthrate\n'))
death_rate = int(input('Enter the deathrate\n'))
population = int(input('Enter the population\n'))


print('The Rate Of Natural Increase equals to', RateOfNaturalIncrease(birth_rate, death_rate, population))

