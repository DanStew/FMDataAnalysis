import QtQuick 6.0
import QtQuick.Controls 2.1
import QtQuick.Window 2.1
import QtQuick.Controls.Material 2.1
import io.qt.textproperties

Item {
    id: root
    width: 800
    height: 600

    //Making the loader
    Loader{
        id : loader
        anchors.fill : parent
        sourceComponent : rect
    }

    //Connecting the python slots
    QmlSlots{
        id : qmlSlots
    }


    Component{
        id : rect

        Rectangle {
            id: rectangle
            x: 0
            y: 0
            width: 800
            height: 600
            color: "#fff1bb"


            Text {
                id: player_scores_title
                x: 63
                y: 72
                text: qsTr("Generate Player Scores")
                font.pixelSize: 60
                font.family: "Arial"
                font.italic: true
                font.bold: true
            }

            Text {
                id: info_text
                x: 37
                y: 151
                width: 726
                height: 104
                text: qsTr("How would you like to input your player data ?")
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WrapAnywhere
                font.italic: false
                font.bold: false
                clip: false
            }

            Rectangle {
                id: file_input_rectangle
                x: 69
                y: 417
                width: 375
                height: 52
                color: "#ffffff"

                TextInput {
                    id: file_input
                    x: 3
                    y: 3
                    width: 369
                    height: 46
                    font.pixelSize: 30
                    verticalAlignment: Text.AlignVCenter
                    font.italic: true

                    //Making placeholder text in the input
                    property string placeholderText: "Enter File Name..."

                    Text {
                        text: file_input.placeholderText
                        font.pointSize : 30
                        color: "#aaa"
                        visible: !file_input.text
                    }
                }
            }

            Button {
                id: button
                x: 490
                y: 414
                width: 264
                height: 52
                text: qsTr("Submit File")
                font.family: "Arial"
                font.bold: true
                font.pointSize: 30
                spacing: 4

                MouseArea {
                    anchors.fill: parent
                    onClicked : {
                        qmlSlots.test_slot(file_input.text)
                        if (file_input.text == ""){
                            file_input.text = "OMG"
                        }
                        else{
                            file_input.text = "Worked"
                        }
                    }
                    cursorShape : Qt.PointingHandCursor
                }
            }

            Button {
                id: button1
                x: 188
                y: 290
                text: qsTr("Submit Latest File")
                font.family: "Arial"
                font.bold: true
                font.pointSize: 40

                MouseArea {
                    anchors.fill: parent
                    cursorShape : Qt.PointingHandCursor
                }
            }

            Text {
                id: error_message
                x: 98
                y: 482
                width: 604
                height: 96
                color: "#fe0808"
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.Wrap
                font.italic: true
                font.bold: true
            }

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
                    cursorShape : Qt.PointingHandCursor
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
                        cursorShape : Qt.PointingHandCursor
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
        }
    }
}
