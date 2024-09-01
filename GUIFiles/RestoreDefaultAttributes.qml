import QtQuick 6.0
import QtQuick.Controls 2.1
import QtQuick.Window 2.1
import QtQuick.Controls.Material 2.1
import io.qt.textproperties

Item {
    id: root
    width: 800
    height: 600

    QmlSlots {
        id: qmlSlots
    }

    Loader {
        id: loader
        anchors.fill: parent
        sourceComponent: rect
    }

    Component {
        id: rect
        Rectangle {
            id: rectangle
            x: 0
            y: 0
            width: 800
            height: 600
            color: "#fff1bb"

            //The upper right rectangle to go back to the main menu
            Rectangle {
                id: return_background_1
                x: 0
                y: 0
                width: 200
                height: 54
                color: "#ff0000"

                //Transporting the user to another file
                MouseArea {
                    anchors.fill: parent
                    onClicked: loader.source = "MainWindow.qml"
                    cursorShape: Qt.PointingHandCursor
                }

                Rectangle {
                    id: return_background_2
                    x: 149
                    y: 0
                    width: 114
                    height: 54
                    color: "#ff0000"
                    radius: 27

                    //Transporting the user to another file
                    MouseArea {
                        anchors.fill: parent
                        onClicked: loader.source = "MainWindow.qml"
                        cursorShape: Qt.PointingHandCursor
                    }
                }

                Text {
                    id: return_button_text
                    x: 15
                    y: 11
                    width: 228
                    height: 32
                    color: "#ffffff"
                    text: qsTr("Back To Main Menu")
                    font.pixelSize: 24
                    font.bold: true
                }
            }

            Text {
                id: main_title
                x: 31
                y: 68
                text: qsTr("Restore Default Attributes")
                font.pixelSize: 60
                font.family: "Arial"
                font.italic: true
                font.bold: true
            }

            Text {
                id: confirm_text_info
                x: 42
                y: 244
                text: qsTr("Type \"Yes\" to confirm : ")
                font.pixelSize: 40
                font.italic: true
                font.bold: false
            }

            Rectangle {
                id: input_background_rectangle
                x: 513
                y: 259
                width: 200
                height: 43
                color: "#ffffff"

                TextInput {
                    id: confirm_input
                    x: 5
                    y: 3
                    width: 190
                    height: 40
                    font.pixelSize: 40
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    rotation: -0.122
                }
            }

            Button {
                id: confirm_button
                x: 165
                y: 382
                text: qsTr("Restore Default Attributes")
                font.pointSize: 30

                MouseArea {
                    anchors.fill: parent
                    cursorShape : Qt.PointingHandCursor
                    onClicked : {
                        error_message.text = qmlSlots.restoreDefaultAttributes(confirm_input.text)
                    }
                }
            }

            Text {
                id: error_message
                x: 42
                y: 471
                width: 730
                height: 109
                color: "#ff021b"
                font.pixelSize: 30
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.WordWrap
                font.bold: true
            }
        }
    }
}
