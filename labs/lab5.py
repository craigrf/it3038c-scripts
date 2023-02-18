import datetime
while True:
    try:
        birthDay = input("Enter your birthday (format: January 1 1901): ")
        bday = datetime.datetime.strptime(birthDay, '%B %d %Y')
        break
    except:
        print("Wrong format; please enter your birthday in the following format: January 1 1901")
currentDay = datetime.datetime.today()
time = (currentDay - bday).total_seconds()
print("You are ",time," seconds old!")