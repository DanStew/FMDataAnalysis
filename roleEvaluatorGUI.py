import sys
from PySide6.QtCore import QObject, Slot
from PySide6.QtWidgets import QApplication,QPushButton
from PySide6.QtQml import QmlElement
from PySide6.QtQuick import QQuickView
from PySide6.QtCore import Slot, QObject
from PySide6.QtQml import QmlElement

QML_IMPORT_NAME = "io.qt.textproperties"
QML_IMPORT_MAJOR_VERSION = 1

@QmlElement
class QmlSlots(QObject):
    def __init__(self):
        super().__init__()

    @Slot(str)
    def test_slot(self,str):
        view.setSource("./GUIFiles/GenerateAttributeRankings.qml")

class MainWindow(QQuickView):
    def __init__(self):
        super().__init__()
        self.setSource("./GUIFiles/MainWindow.qml")
        self.rootContext().setContextProperty("QmlSlots", self)

app = QApplication()
view = MainWindow()
view.show()
sys.exit(app.exec())

