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

