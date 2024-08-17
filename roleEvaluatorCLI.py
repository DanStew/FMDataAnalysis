import sys
#Importing the functions needed to make the CLI work
from roleEvaluatorFunctions import outputPlayerScores, updateAttributeRankings, ensureUserResponse

#Start Point of the Program, CLI Menu
def mainFunction():
    while True:
        #Outputting options to the user
        print()
        print("===============================================================")
        print("      Welcome to Football Manager Player Analysis")
        print()
        print("Please input a number from the options below : ")
        print("1. Generate and Output Player Scores")
        print("2. Update Attribute Ranking Variables")
        print("3. Reset Attribute Rankings")
        print("4. Exit Program")
        #Collecting the input from the user
        nmb = input("Enter your choice (1 to 4) : ")
        if (nmb!="1" and nmb!="2" and nmb!="3" and nmb!="4"):
            print("Input must be a whole number between 1 and 4")
            print()
        #Transferring user to the location they want
        if (nmb == "1"):
            print("Transferring you to the Player Role Generator System...")
            print()
            outputPlayerScores()
            print()
        if (nmb == "2"):
            print("Transferring you to the Attribute Updater System...")
            print()
            updateAttributeRankings()
            print()
        if (nmb == "3"):
            print("Transferring you to the Reset Attribute Multipliers System...")
            print()
            ensureUserResponse()
            print()
        if (nmb == "4"):
            print("PROGRAM EXITING...")
            sys.exit()

#Calling the start point
if __name__ == "__main__":
    mainFunction()

