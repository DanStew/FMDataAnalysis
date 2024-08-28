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
    Loader {
        id: loader
        anchors.fill: parent
        sourceComponent: rect
    }

    //Connecting the python slots
    QmlSlots{
        id : qmlSlots
    }

    Component {
        id: rect

        Rectangle {
            id: root
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
                id: error_value_manager_title
                x: 130
                y: 60
                text: qsTr("Error Value Manager")
                font.pixelSize: 60
                font.italic: true
                font.bold: true
                font.family: "Arial"
            }

            Text {
                id: error_value_manager_info
                x: 80
                y: 136
                width: 653
                height: 92
                text: qsTr("If empty attributes are found within the data, you would like to...")
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
            }

            ComboBox {
                id: error_value_manager_selection
                x: 153
                y: 257
                width: 515
                height: 40
                font.bold: false
                font.pointSize: 20
                model: ["Remove players with blank attributes", "Replace blank attributes with value"]
            }

            Text {
                id: attribute_replacer_text
                //Only displaying item when Replace blank attributes with value selected
                visible : error_value_manager_selection.currentText === "Replace blank attributes with value"
                x: 25
                y: 344
                text: qsTr("Replace blank attributes with value : ")
                font.pixelSize: 32
            }

            Button {
                id: error_value_manager_submission
                x: 218
                y: 450
                width: 414
                height: 67
                text: qsTr("Continue Processing")
                font.pointSize: 32

                MouseArea {
                    anchors.fill: parent
                    cursorShape : Qt.PointingHandCursor
                    onClicked : {
                        var userAnswers = qmlSlots.get_user_answers(error_value_manager_selection.currentText,attribute_replacer_input.text)
                        if (userAnswers[0] === "ERROR"){
                            error_message.text = "Attribute Replacement input must be an int"
                        }
                        else{
                            //Recollecting the file name
                            var fileName = qmlSlots.get_input_file()
                            //Outputting the player scores
                            qmlSlots.output_player_scores(fileName,userAnswers)
                            loader.source = "OutputPlayerScoresSuccess.qml"
                        }
                    }
                }
            }
            Rectangle {
                id: attribute_replacer_background
                //Only displaying item when Replace blank attributes with value selected
                visible : error_value_manager_selection.currentText === "Replace blank attributes with value"
                x: 564
                y: 351
                width: 200
                height: 47
                color: "#ffffff"

                TextInput {
                    id: attribute_replacer_input
                    //Only displaying item when Replace blank attributes with value selected
                    visible : error_value_manager_selection.currentText === "Replace blank attributes with value"
                    x: 0
                    y: 2
                    width: 200
                    height: 42
                    font.pixelSize: 40
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            
            Text {
                id: error_message
                x: 98
                y: 520
                width: 604
                height: 96
                color: "#fe0808"
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.Wrap
                font.italic: true
                font.bold: true
            }
        }
    }
}
