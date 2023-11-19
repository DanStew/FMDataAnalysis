import glob
import os

def readFile():
    #Finding the lastest file made in your data file
    def findFile():
        list_of_files = glob.glob('./FMData/*') # * means all if need specific format then *.csv
        print(list_of_files)
        latest_file = max(list_of_files, key=os.path.getctime)
        return latest_file
    
    #Applying the formatting for each line within the file, to return the attributes
    def formatLine(line):
        tempData = line.split("|") #Spltting the data into the individual columns
        lineData = []
        for item in tempData:
            item = item.strip() #Removing the whitespace
            #Removing the empty or pointless array entries
            if item != "," and item != "":
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
        if lineData != []:
            fileData.append(lineData) #Adding player information to overall data array
    return fileData 

print(readFile())
