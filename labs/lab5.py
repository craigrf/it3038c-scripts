import datetime

# will keep looping until the proper input format has been entered
# format is Month(January) Day(1) Year(1901)
while True:
    try:
        birthDay = input("Enter your birthday (format: January 1 1901): ")
        bday = datetime.datetime.strptime(birthDay, '%B %d %Y') # sets format for input
        break
    except:
        print("Wrong format; please enter your birthday in the following format: January 1 1901") #in case input is incorrect format
currentDay = datetime.datetime.today() # day that this script run by user
time = (currentDay - bday).total_seconds() # subtracts date that was inputted from day this script runs and changes it to seconds
print("You are ",time," seconds old!") # outputs how old user is in seconds based on their input