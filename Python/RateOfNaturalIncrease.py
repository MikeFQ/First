
# The rate of natural increase refers to the difference between the number
# of live births and the number of deaths occurring in a year,
# divided by the mid-year population of that year, multiplied by a factor (usually 1,000).
# It is equal to the difference between the crude birth rate and the crude death rate.
# This measure of the population change excludes the effects of migration.

region = str(input("Enter your country or region "))
births = int(input("Enter the number of live births "))
deaths = int(input("Enter the number of deaths "))
population = int(input("Enter the mid-year population "))

RNI = (births - deaths) / population * 1000

if RNI > 30:
    print(region + " has very high RNI: ", RNI)
elif RNI > 20:
    print(region + " has high RNI: ", RNI)
elif RNI > 10:
    print(region + " has moderate RNI: ", RNI)
elif RNI > 2:
    print(region + " has low RNI: ", RNI)
elif RNI < 2:
    print(region + " has very low RNI: ", RNI)
else:
    print("Enter valid input")
