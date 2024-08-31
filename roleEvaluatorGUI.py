#Importing the QML Functions needed for this file
import sys
import os
from PySide6.QtCore import QObject, Slot
from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QmlElement
from PySide6.QtQuick import QQuickView
from PySide6.QtCore import Slot, QObject
from PySide6.QtQml import QmlElement

#Importing the roleEvaluator functions needed
from roleEvaluatorFunctions import validateFileInput, readFile, outputPlayerScores,getLatestFile

QML_IMPORT_NAME = "io.qt.textproperties"
QML_IMPORT_MAJOR_VERSION = 1

#Making a class of Slots to be used in the QML files
@QmlElement
class QmlSlots(QObject):
    def __init__(self):
        super().__init__()
        self.checkedFiles = False

    @Slot(str)
    def test_slot(self,str):
        print(str)

    @Slot(str,result=bool)
    #Ensuring the file name given is a valid file in the FMData folder
    def validate_file_input(self,fileName):
        return validateFileInput(fileName)
    
    #Getting the path to the inputted file, if the file has been validated
    @Slot(str,result=str)
    def get_input_file_path(self,fileName):
        cur_path = os.path.dirname(__file__)
        new_path = os.path.relpath(".\\FMData\\" + fileName, cur_path)
        return new_path

    #Function to get the latest file in the FMData folder
    @Slot(result=str)
    def get_latest_file(self):
        return getLatestFile()
    
    #Getter and Setter you the input_file variable
    @Slot(str)
    def set_input_file(self,fileName):
        savedItems.set_input_file(fileName)

    @Slot(result=str)
    def get_input_file(self):
        return savedItems.get_input_file()
    
    #Function to make the userAnswers array
    @Slot(str,str,result=list)
    def get_user_answers(self,userInput,attribute_value):
        if userInput == "Replace blank attributes with value":
            try:
                attribute_value = int(attribute_value)
            except:
                return ["ERROR"]
            return ["REPLACE", attribute_value]
        else:
            return ["REMOVE"]
        
    #Function to output player scores to the user
    @Slot (str,list)
    def output_player_scores(self,fileName,userAnswers):
        fileData = readFile(fileName)
        outputPlayerScores(fileData,userAnswers)

    #Function to return the correct the correct text to be displayed, depending on the role selected
    @Slot (str,str,result=str)
    def getAttributeText(self,attribute,playerRole):
        #Seeing if the player role is a goalkeeper
        if "K" in playerRole:
            #Making alternate text for all the attributes
            outputText = {"Corners : " : "Aerial Reach : ","Crossing : " : "C... of Area : ","Dribbling : " : "Communication : ","Finishing : " : "Eccentricity : ","First Touch : " : "First Touch : ","Free Kicks : " : "Handling : ","Heading : " : "Kicking : ","Long Shots : " : "One on Ones : ","Long Throws : " : "Passing : ","Marking : " : "Punching : ","Passing : " : "Reflexes : ","Penalty Taking : " : "Rushing Out : ","Tackling : " : "Throwing : "}
            #Returning the related attribute text
            try:
                return outputText[attribute]
            except:
                return "Error"
        else: 
            #Outputting the attribute
            return attribute
        
    #Function to return the Current Attribute Ranking of the given attribute in the given role
    @Slot (str,str,result=str)
    def getAttributeRanking(self,playerRole,attribute):
        #Returning nothing if technique is involved in a keeper role
        if "K" in playerRole and attribute == "technique":
            return ""
        if playerRole == "":
            return ""
        #Translating some of the attributes
        #These are used the translate the 13 attributes which could be two different values
        try:
            #Seeing if attribute is a number
            attribute = int(attribute)
            #Translating attribute to be the correct value
            if "K" in playerRole:
                valToAtt = {1 : "aerial reach",2 : "command of area",3 : "communication",4 : "eccentricity",5 : "first touch",6 : "handling",7:"kicking",8 : "1v1",9:"passing",10:"punching",11:"reflexes",12:"rushing out",13:"throwing"}
                attribute = valToAtt[attribute]
            else:
                valToAtt = {1 : "corners",2 : "crossing",3 : "dribbling",4 : "finishing",5 : "first touch",6 : "free kicks",7:"heading",8 : "long shots",9:"long throws",10:"marking",11:"passing",12:"penalty taking",13:"tackling"}
                attribute = valToAtt[attribute]
        except:
            attribute = attribute
        #Finding the index of the attribute within the line
        attributeIndex = 0
        try:
            cur_path = os.path.dirname(__file__)
            new_path = os.path.relpath(".\\AttributeRankings\\allAttributeOrder.txt", cur_path)
            file = open(new_path, encoding="utf8")
            #Collecting the info from the file
            fileInfo = []
            for line in file:
                fileInfo.append(line)
            #Finding the correct string to search through
            attributeOrder = []
            if "K" in playerRole : 
                attributeOrder = fileInfo[0].split(" : ")[1]
            else : 
                attributeOrder = fileInfo[1].split(" : ")[1]
            #Finding the index of the attribute within the file order
            attributeOrder = attributeOrder.strip().split(",")
            attributeIndex = attributeOrder.index(attribute)
            file.close()
        except:
            return ""
        #Finding the item at that index, in the current attribute rankings file
        try:
            #Getting the file
            cur_path = os.path.dirname(__file__)
            new_path = os.path.relpath(".\\AttributeRankings\\currentAttributeRankings.txt", cur_path)
            file = open(new_path, encoding="utf8")
            #Finding the line we are lookign for
            for line in file:
                lineInfo = line.split(" : ")
                if lineInfo[0] == playerRole:
                    attributeInfo = lineInfo[1].split(",")
                    return str(attributeInfo[attributeIndex])
        except:
            return ""
        
    #Function to process the updating of attributes
    @Slot (str,list,result=str)
    def processUpdateAttributes(self,playerRole,attributeInputs):
        #Ensuring all the attributes have been stripped
        for i,item in enumerate(attributeInputs):
            #Removing technique attribute, if the player role is a goalkeeper
            if ("K" in playerRole and i == 13):
                del attributeInputs[i]
                continue
            if (self.checkValidAttribute(item.strip())):
                attributeInputs[i] = item
            else:
                return "Error : One or more attributes are null"
        #Making an attribute string to be used
        attributeString = ",".join(str(attribute) for attribute in attributeInputs)
        #Opening the file and finding where we need to place this new string
        try:
            cur_path = os.path.dirname(__file__)
            new_path = os.path.relpath(".\\AttributeRankings\\currentAttributeRankings.txt", cur_path)
            file = open(new_path, encoding="utf8")
            #Getting all the data from the file
            fileData = []
            for line in file:
                lineData = line.split(" : ")
                #If the line corresponds to the role we want, include the new attributeString
                if lineData[0] == playerRole:
                    lineData[1] = attributeString
                newLine = lineData[0] + " : " + lineData[1]
                fileData.append(newLine)
            file.close()
            #Rewriting all the data back into the file
            file = open(new_path,"w", encoding="utf8")
            for line in fileData:
                file.write(line)
            file.close()
            return "Attribute Rankings have been successfully updated"
        except:
            return "Error : currentAttributeRankings.txt could not be found in the AttributeRankings folder"
    
    #Function to return whether the value given is a valid attribute or not
    @Slot (str,result=bool)
    def checkValidAttribute(self,possibleAttribute):
        try:
            #Seeing if the attribute is an integer
            int(possibleAttribute)
            return True
        except:
            return False
        
    #Function to check whether there will occur any errors when updating attributes
    @Slot (str,result=str)
    def checkErrors(self,currentError):
        #If there is already an error, you don't need to check for another error
        if currentError != "":
            return currentError
        #Checking for errors that could occur during the checkValidAttribute file
        #Only implementing this code once
        if not self.checkedFiles:
            #Ensuring the allAttributeOrder.txt file is present
            try:
                cur_path = os.path.dirname(__file__)
                new_path = os.path.relpath(".\\AttributeRankings\\allAttributeOrder.txt", cur_path)
                open(new_path)
            except:
                return "allAttributeOrder.txt could not be found within the AttributeRankings file"
            #Ensuring the currentAttributeRankings.txt file is present
            try:
                cur_path = os.path.dirname(__file__)
                new_path = os.path.relpath(".\\AttributeRankings\\currentAttributeRankings.txt", cur_path)
                open(new_path)
            except:
                return "currentAttributeRankings.txt could not be found within the AttributeRankings file"
            #Telling the system that the files have been checked
            self.checkedFiles = True
        return ""
        
    
    #Function to check whether technique component needs to be hidden or not
    @Slot (str,result=bool)
    def checkHide(self,playerRole):
        #Seeing if the role is a goalkeeper or not
        if "K" in playerRole : 
            return False
        else:
            return True


#Class to store a set of saved information needed in the system
class SavedItems():
    def __init__(self):
        self.input_file = ""

    #Getting and setting the input file
    def set_input_file(self,fileName):
        self.input_file = fileName

    def get_input_file(self):
        return self.input_file

#Making the mainWindow to display the GUI
class MainWindow(QQuickView):
    def __init__(self):
        super().__init__()
        self.setSource("./GUIFiles/MainWindow.qml")
        self.rootContext().setContextProperty("QmlSlots", self)

#Making and displaying the application
savedItems = SavedItems()
app = QApplication()
view = MainWindow()
view.show()
sys.exit(app.exec())

