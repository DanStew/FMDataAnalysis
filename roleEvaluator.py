import glob
import os
import sys
from tabulate import tabulate
import uuid

# Function to find and read the latest file from FMData
def readFile():
    # Finding the lastest file made in your data file
    def findFile():
        # Finding out what way they would like to input their data
        choice = ""
        # Repeating until a valid input is given
        while choice != "LATEST" and choice != "INPUT":
            print(
                "Would you like to choose the latest file in FMData or input the file name yourself?"
            )
            choice = input("Please enter LATEST or INPUT... : ").upper()
        if choice == "LATEST":
            list_of_files = glob.glob(
                "./FMData/*"
            )  # * means all if need specific format then *.csv
            latest_file = max(list_of_files, key=os.path.getctime)
            return latest_file
        else:
            acceptedFile = False
            while acceptedFile == False:
                try:
                    # Getting the file from the user
                    inputFile = input(
                        "Please enter the file name and its extension (should be .rtf), or QUIT to exit the program : "
                    )
                    # Seeing if the user wants to Quit
                    if inputFile == "QUIT":
                        return inputFile
                    # Finding the location of inputted file
                    cur_path = os.path.dirname(__file__)
                    new_path = os.path.relpath(".\\FMData\\" + inputFile, cur_path)
                    # Seeing if the inputted file exists
                    testOpen = open(new_path, encoding="utf8")
                    acceptedFile = True
                    return new_path
                # If inputted file doesn't exist, return error and repeat
                except:
                    print("This file name cannot be found within the FMData folder")

    # Applying the formatting for each line within the file, to return the attributes
    def formatLine(line):
        tempData = line.split("|")  # Spltting the data into the individual columns
        lineData = []
        for item in tempData:
            item = item.strip()  # Removing the whitespace
            lineData.append(
                item
            )  # Adding the items to an array for the players information
        return lineData

    # Opening the latest file made in your data file - using findFile()
    fileName = findFile()
    # Seeing if the user enterred that they would like to quit
    if fileName == "QUIT":
        return "QUIT"
    file = open(fileName, encoding="utf8")
    # Formatting the files data
    fileData = []
    for i, line in enumerate(file):
        # Cutting out all the filler lines, eg "| ------- | "
        if i % 2 == 1:
            continue
        lineData = formatLine(
            line
        )  # Formatting the line to return array of information
        lineData = lineData[2:]  # Eliminating first item (Always empty)
        lineData = lineData[
            :-1
        ]  # Eliminating last item from the array (This is always empty)
        if lineData != []:
            if lineData[1] == "":
                continue
            fileData.append(lineData)  # Adding player information to overall data array
    # Removing the first element from the file data
    fileData = fileData[1:]
    return fileData


# Function to create an array of player dictionaires containing all of the key information about that player
def createPlayerInfo(fileData):
    playerInfos = []
    for player in fileData:
        # Creating the dictionary
        playerInfo = dict()
        playerInfo["Information"] = player[0]
        playerInfo["Name"] = player[1]
        playerInfo["Position"] = player[2]
        playerInfo["Club"] = player[3]
        playerInfo["Nationality"] = player[4]
        playerInfo["Age"] = int(player[5])
        playerInfo["TransferValue"] = player[6]
        playerInfo["Wage"] = player[7]
        playerInfo["Right Foot"] = player[8]
        playerInfo["Left Foot"] = player[9]
        # Appending the dictionary to the array
        playerInfos.append(playerInfo)
    return playerInfos


# Function to remove any masked attributes there are
def removeMaskedAttributes(fileData, userAnswers):
    # Making a copy of fileData
    tempData = []
    # Looping through all the attributes we are concerned with
    for i, player in enumerate(fileData):
        tempPlayer = []
        addPlayer = True
        for j, attribute in enumerate(player):
            # Seeing if a - is contained within the attribute
            if "-" in attribute and j > 9:
                # Getting the two values
                attributeValues = attribute.split("-")
                # If attributeValues[0] if "", the player hasn't been fully scouted
                # Therefore, user will be asked whether they want to continue
                if attributeValues[0] == "":
                    # If the user chose replace, set the attribute value to the replace value
                    if userAnswers[0] == "REPLACE":
                        attribute = userAnswers[1]
                    else:
                        addPlayer = False
                        break
                else:
                    # Making an average of the two masked values
                    attribute = round(
                        (int(attributeValues[0]) + int(attributeValues[1])) / 2
                    )
            # Appending the attribute to the new tempPlayer array
            tempPlayer.append(attribute)
        # Appending the tempPlayer to the tempData array
        if addPlayer == True:
            tempData.append(tempPlayer)
    return tempData


# Asking user some questions about what they would like to do in certain situations
def askUserQuestions():
    # Seeing what the user would like to do with the value
    print("If a Player has been found with empty attribute values")
    print(
        "Would you like to replace empty attributes with a value or remove the player"
    )
    userInput = ""
    while userInput != "REPLACE" and userInput != "REMOVE":
        userInput = input("Please enter REPLACE or REMOVE... : ").upper()
    if userInput == "REPLACE":
        attributeAccepted = False
        while not attributeAccepted:
            try:
                attributeAvg = round(
                    float(input("Enter the value you would like to replace it with : ")), 1
                )
                attributeAccepted = True
            except:
                print("Enterred value must be of type float")
        # Returning the users option and value
        return ["REPLACE", attributeAvg]
    # If the user chose to remove the player
    else:
        return ["REMOVE"]


# Function to create an array of player dictionaries containing all of the attributes from that player
def createPlayerAttributes(fileData):
    # Creating array to store all the dictionaries
    playerDicts = []
    for player in fileData:
        # Creating the player dictionary
        playerDict = dict()
        playerDict["Corners"] = int(player[10])
        playerDict["Crossing"] = int(player[11])
        playerDict["Dribbling"] = int(player[12])
        playerDict["Finishing"] = int(player[13])
        playerDict["First Touch"] = int(player[14])
        playerDict["Free Kicks"] = int(player[15])
        playerDict["Heading"] = int(player[16])
        playerDict["Long Shots"] = int(player[17])
        playerDict["Long Throws"] = int(player[18])
        playerDict["Marking"] = int(player[19])
        playerDict["Passing"] = int(player[20])
        playerDict["Penalty Taking"] = int(player[21])
        playerDict["Tackling"] = int(player[22])
        playerDict["Technique"] = int(player[23])
        playerDict["Aggression"] = int(player[24])
        playerDict["Anticipation"] = int(player[25])
        playerDict["Bravery"] = int(player[26])
        playerDict["Composure"] = int(player[26])
        playerDict["Concentration"] = int(player[28])
        playerDict["Decisions"] = int(player[29])
        playerDict["Determination"] = int(player[30])
        playerDict["Flair"] = int(player[31])
        playerDict["Leadership"] = int(player[32])
        playerDict["Off The Ball"] = int(player[33])
        playerDict["Positioning"] = int(player[34])
        playerDict["Teamwork"] = int(player[35])
        playerDict["Vision"] = int(player[36])
        playerDict["Work Rate"] = int(player[37])
        playerDict["Acceleration"] = int(player[38])
        playerDict["Agility"] = int(player[39])
        playerDict["Balance"] = int(player[40])
        playerDict["Jumping Reach"] = int(player[41])
        playerDict["Natural Fitness"] = int(player[42])
        playerDict["Pace"] = int(player[43])
        playerDict["Stamina"] = int(player[44])
        playerDict["Strength"] = int(player[45])
        playerDict["Aerial Reach"] = int(player[46])
        playerDict["Command Of Area"] = int(player[47])
        playerDict["Communication"] = int(player[48])
        playerDict["Eccentricity"] = int(player[49])
        playerDict["Handling"] = int(player[50])
        playerDict["Kicking"] = int(player[51])
        playerDict["1v1"] = int(player[52])
        playerDict["Punching"] = int(player[53])
        playerDict["Reflexes"] = int(player[54])
        playerDict["Rushing Out"] = int(player[55])
        playerDict["Throwing"] = int(player[56])
        # Appending the dictionary to the array
        playerDicts.append(playerDict)
    return playerDicts

#Function to get the names of all of the player roles that will / have been generated
def getPlayerRoles():
    try:
        # Finding the location of Attribute Rankings file file
        cur_path = os.path.dirname(__file__)
        new_path = os.path.relpath(".\\AttributeRankings\\currentAttributeRankings.txt", cur_path)
        # Opening the file
        attributeRankings = open(new_path, encoding="utf8")
        #Making an empty array, to store the player roles
        playerRoles = dict()
        for line in attributeRankings:
            #Separting the line into its two parts
            lineInfo = line.split(" : ")
            #Appending the player role to the playerRoles array
            playerRoles[lineInfo[0]] = lineInfo[0]
        return playerRoles
    #If the currentAttributeRankings file doesn't exist
    except:
        print("currentAttributeRankings file cannot be found within the AttributeRankings folder")
        print("PROGRAM EXITING...")
        sys.exit()


# Function which generates the player scores, for every player
def createPlayerScores(playerInfos, playerAttributes):
    # Looping through every player
    for i, playerInfo in enumerate(playerInfos):
        # Generating a score for every role in the game
        try: 
            # Finding the location of Attribute Rankings file file
            cur_path = os.path.dirname(__file__)
            new_path = os.path.relpath(".\\AttributeRankings\\currentAttributeRankings.txt", cur_path)
            # Opening the file
            attributeRankings = open(new_path, encoding="utf8")
            for line in attributeRankings:
                # Breaking the line down into two parts
                lineInfo = line.strip().split(" : ")
                #Finding out what number we need to divide by and creating array of int values
                tempArr = lineInfo[1].split(",")
                count = 0
                attMults = []
                for nmb in tempArr:
                    count += int(nmb)
                    attMults.append(int(nmb))
                # Seeing if we are looking at a goalKeeper role
                if "K" in lineInfo[0]:
                    playerInfo[lineInfo[0]] = round(
                        (
                            (
                                playerAttributes[i]["Aerial Reach"] * attMults[0]
                                + playerAttributes[i]["Command Of Area"] * attMults[1]
                                + playerAttributes[i]["Communication"] * attMults[2]
                                + playerAttributes[i]["Eccentricity"] * attMults[3]
                                + playerAttributes[i]["First Touch"] * attMults[4]
                                + playerAttributes[i]["Handling"] * attMults[5]
                                + playerAttributes[i]["Kicking"] * attMults[6]
                                + playerAttributes[i]["1v1"] * attMults[7]
                                + playerAttributes[i]["Passing"] * attMults[8]
                                + playerAttributes[i]["Punching"] * attMults[9]
                                + playerAttributes[i]["Reflexes"] * attMults[10]
                                + playerAttributes[i]["Rushing Out"] * attMults[11]
                                + playerAttributes[i]["Throwing"] * attMults[12]
                                + playerAttributes[i]["Aggression"] * attMults[13]
                                + playerAttributes[i]["Anticipation"] * attMults[14]
                                + playerAttributes[i]["Bravery"] * attMults[15]
                                + playerAttributes[i]["Composure"] * attMults[16]
                                + playerAttributes[i]["Concentration"] * attMults[17]
                                + playerAttributes[i]["Decisions"] * attMults[18]
                                + playerAttributes[i]["Determination"] * attMults[19]
                                + playerAttributes[i]["Flair"] * attMults[20]
                                + playerAttributes[i]["Leadership"] * attMults[21]
                                + playerAttributes[i]["Off The Ball"] * attMults[22]
                                + playerAttributes[i]["Positioning"] * attMults[23]
                                + playerAttributes[i]["Teamwork"] * attMults[24]
                                + playerAttributes[i]["Vision"] * attMults[25]
                                + playerAttributes[i]["Work Rate"] * attMults[26]
                                + playerAttributes[i]["Acceleration"] * attMults[27]
                                + playerAttributes[i]["Agility"] * attMults[28]
                                + playerAttributes[i]["Balance"] * attMults[29]
                                + playerAttributes[i]["Jumping Reach"] * attMults[30]
                                + playerAttributes[i]["Natural Fitness"] * attMults[31]
                                + playerAttributes[i]["Pace"] * attMults[32]
                                + playerAttributes[i]["Stamina"] * attMults[33]
                                + playerAttributes[i]["Strength"] * attMults[34]
                            )
                            / count
                        )
                        * 5,
                        1,
                    )
                else:
                    playerInfo[lineInfo[0]] = round(
                        (
                            (
                                playerAttributes[i]["Corners"] * attMults[0]
                                + playerAttributes[i]["Crossing"] * attMults[1]
                                + playerAttributes[i]["Dribbling"] * attMults[2]
                                + playerAttributes[i]["Finishing"] * attMults[3]
                                + playerAttributes[i]["First Touch"] * attMults[4]
                                + playerAttributes[i]["Free Kicks"] * attMults[5]
                                + playerAttributes[i]["Heading"] * attMults[6]
                                + playerAttributes[i]["Long Shots"] * attMults[7]
                                + playerAttributes[i]["Long Throws"] * attMults[8]
                                + playerAttributes[i]["Marking"] * attMults[9]
                                + playerAttributes[i]["Passing"] * attMults[10]
                                + playerAttributes[i]["Penalty Taking"] * attMults[11]
                                + playerAttributes[i]["Tackling"] * attMults[12]
                                + playerAttributes[i]["Technique"] * attMults[13]
                                + playerAttributes[i]["Aggression"] * attMults[14]
                                + playerAttributes[i]["Anticipation"] * attMults[15]
                                + playerAttributes[i]["Bravery"] * attMults[16]
                                + playerAttributes[i]["Composure"] * attMults[17]
                                + playerAttributes[i]["Concentration"] * attMults[18]
                                + playerAttributes[i]["Decisions"] * attMults[19]
                                + playerAttributes[i]["Determination"] * attMults[20]
                                + playerAttributes[i]["Flair"] * attMults[21]
                                + playerAttributes[i]["Leadership"] * attMults[22]
                                + playerAttributes[i]["Off The Ball"] * attMults[23]
                                + playerAttributes[i]["Positioning"] * attMults[24]
                                + playerAttributes[i]["Teamwork"] * attMults[25]
                                + playerAttributes[i]["Vision"] * attMults[26]
                                + playerAttributes[i]["Work Rate"] * attMults[27]
                                + playerAttributes[i]["Acceleration"] * attMults[28]
                                + playerAttributes[i]["Agility"] * attMults[29]
                                + playerAttributes[i]["Balance"] * attMults[30]
                                + playerAttributes[i]["Jumping Reach"] * attMults[31]
                                + playerAttributes[i]["Natural Fitness"] * attMults[32]
                                + playerAttributes[i]["Pace"] * attMults[33]
                                + playerAttributes[i]["Stamina"] * attMults[34]
                                + playerAttributes[i]["Strength"] * attMults[35]
                            )
                            / count
                        )
                        * 5,
                        1,
                    )
        except:
            print("currentAttributeRankings.txt cannot be found within the AttributeRankings file")
            print("PROGRAM EXITING...")
            sys.exit()
    return playerInfos

#Function used to create and output a table, in the form of a HTML file
def createTable(playerRoles,playerInfos):
    #Creating the table information
    tableHeaders = {"Inf":"Inf","Name":"Name","Position(s)":"Positions(s)","Club":"Club","Nationality":"Nationality"} | playerRoles
    #Finding the file to output the HTML table
    cur_path = os.path.dirname(__file__)
    #Creating a randomly generated file name
    filename = str(uuid.uuid4()) + ".html"
    new_path = os.path.relpath(".\\OutputTables\\" + filename, cur_path)
    tableFile = open(new_path,"w", encoding="utf8")
    #Making the table
    #Connecting the style sheet, inputting the head information
    htmlHead = '<head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Player Analysis</title><link rel="stylesheet" href="./TableScripts/tableStyle.css"><script src="./TableScripts/tableScripts.js"></script></head>'
    tableFile.write(htmlHead)
    tableFile.write(tabulate(playerInfos, headers=tableHeaders, tablefmt="html"))

# Reading the file from the user
fileData = readFile()
if fileData == "QUIT":
    print("User has decided to exit the program")
    print("PROGRAM EXITING...")
    sys.exit()
# Removing any of the maksed values
userAnswers = askUserQuestions()
fileData = removeMaskedAttributes(fileData, userAnswers)
# Creating player dictionaries, using the read information
playerInfos = createPlayerInfo(fileData)
playerAttributes = createPlayerAttributes(fileData)
# Creating the player scores
playerRoles = getPlayerRoles()
playerInfos = createPlayerScores(playerInfos, playerAttributes)
# Creating and outputting the table
createTable(playerRoles,playerInfos)

