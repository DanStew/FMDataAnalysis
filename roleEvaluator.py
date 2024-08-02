import glob
import os

#Function to find and read the latest file from FMData
def readFile():
    #Finding the lastest file made in your data file
    def findFile():
        list_of_files = glob.glob('./FMData/*') # * means all if need specific format then *.csv
        latest_file = max(list_of_files, key=os.path.getctime)
        return latest_file
    
    #Applying the formatting for each line within the file, to return the attributes
    def formatLine(line):
        tempData = line.split("|") #Spltting the data into the individual columns
        lineData = []
        for item in tempData:
            item = item.strip() #Removing the whitespace
            lineData.append(item) #Adding the items to an array for the players information
        return lineData
    
    #Opening the latest file made in your data file - using findFile()
    file = open(findFile(),"r")
    #Formatting the files data
    fileData = []
    for i,line in enumerate(file):
        #Cutting out all the filler lines, eg "| ------- | "
        if i%2 == 1:
            continue
        lineData = formatLine(line) #Formatting the line to return array of information
        lineData = lineData[1:] #Eliminating first item (Always empty)
        lineData = lineData[:-1] #Eliminating last item from the array (This is always empty)
        if lineData != []:
            fileData.append(lineData) #Adding player information to overall data array
    return fileData

#Function to create an array of player dictionaries, using the array of player arrays that have been previously made
def createPlayerDicts(fileData):
    #Creating array to store all the dictionaries
    playerDicts = []
    for player in fileData : 
        #Creating the player dictionary
        playerDict = dict()
        playerDict["Information"] = player[1]
        playerDict["Name"] = player[2]
        playerDict["Position"] = player[3]
        playerDict["Club"] = player[4]
        playerDict["Nationality"] = player[5]
        playerDict["Age"] = player[6]
        playerDict["TransferValue"] = player[7]
        playerDict["Wage"] = player[8]
        playerDict["Right Foot"] = player[9]
        playerDict["Left Foot"] = player[10]
        playerDict["Corners"] = player[11]
        playerDict["Crossing"] = player[12]
        playerDict["Dribbling"] = player[13]
        playerDict["Finishing"] = player[14]
        playerDict["First Touch"] = player[15]
        playerDict["Free Kicks"] = player[16]
        playerDict["Heading"] = player[17]
        playerDict["Long Shots"] =  player[18]
        playerDict["Long Throws"] = player[19]
        playerDict["Marking"] = player[20]
        playerDict["Passing"] = player[21]
        playerDict["Penalty Taking"] = player[22]
        playerDict["Tackling"] = player[23]
        playerDict["Technique"] = player[24]
        playerDict["Aggression"] = player[25]
        playerDict["Anticipation"] = player[26]
        playerDict["Bravery"] = player[27]
        playerDict["Composure"] = player[28]
        playerDict["Concentration"] = player[29]
        playerDict["Decisions"] = player[30]
        playerDict["Determination"] = player[31]
        playerDict["Flair"] = player[32]
        playerDict["Leadership"] = player[33]
        playerDict["Off The Ball"] = player[34]
        playerDict["Positioning"] = player[35]
        playerDict["Teamwork"] = player[36]
        playerDict["Vision"] = player[37]
        playerDict["Work Rate"] = player[38]
        playerDict["Acceleration"] = player[39]
        playerDict["Agility"] = player[40]
        playerDict["Balance"] = player[41]
        playerDict["Jumping"] = player[42]
        playerDict["Natural Fitness"] = player[43]
        playerDict["Pace"] = player[44]
        playerDict["Stamina"] = player[45]
        playerDict["Strength"] = player[46]
        playerDict["Aerial Reach"] = player[47]
        playerDict["Command Of Area"] = player[48]
        playerDict["Communication"] = player[49]
        playerDict["Eccentricity"] = player[50]
        playerDict["Handling"] = player[51]
        playerDict["Kicking"] = player[52]
        playerDict["1v1"] = player[53]
        playerDict["Punching"] = player[54]
        playerDict["Reflexes"] = player[55]
        playerDict["Rushing Out"] = player[56]
        playerDict["Throwing"] = player[57]
        #Appending the dictionary to the array
        playerDicts.append(playerDict)
    return playerDicts
    

fileData = readFile()
playerDicts = createPlayerDicts(fileData)
for player in playerDicts : 
    if (player["Name"] == "Callum Lang"):
        print(player["Long Throws"])