import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    width: 800
    height: 600

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

        Text {
            id: page_title
            x: 38
            y: 69
            text: qsTr("Update Attribute Rankings")
            font.pixelSize: 60
            font.bold: true
            font.family: "Arial"
        }

        Text {
            id: player_role_selection_text
            x: 149
            y: 145
            width: 237
            height: 59
            text: qsTr("Player Role : ")
            font.pixelSize: 40
            font.bold: true
        }

        ComboBox {
            id: player_role_selection_input
            x: 434
            y: 150
            width: 189
            height: 50
        }

        ScrollView {
            id: attributes_scrollview
            x: 20
            y: 220
            width: 761
            height: 361
            focusPolicy: Qt.NoFocus
            contentHeight: 720
            contentWidth: 761

            Column {
                id: left_column
                x: 0
                y: 0
                width: 380
                height: 361
                leftPadding: 0
                padding: 0
                spacing: 10

                Text {
                    id: corners_component
                    x: 20
                    text: qsTr("Corners : ")
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    rotation: -0.464
                    font.bold: true

                    Rectangle {
                        id: rectangle1
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: corners_input
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: dribbling_component
                    x: 20
                    text: qsTr("Dribbling : ")
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle3
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: dribbling_input
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component4
                    x: 20
                    text: qsTr("First Touch : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle5
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput4
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component6
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle7
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput6
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component8
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle9
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput8
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component10
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle11
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput10
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component12
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle13
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput12
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component14
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle15
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput14
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component16
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle17
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput16
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component18
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle19
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput18
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component19
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle20
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput19
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component20
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle21
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput20
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component21
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle22
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput21
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component22
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle23
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput22
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component23
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle24
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput23
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component24
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle25
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput24
                        x: 239
                        y: 8
                        width: 105
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component25
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle26
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput25
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component35
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle36
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput35
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component36
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle37
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput36
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }
            }

            Column {
                id: right_column
                x: 380
                y: 0
                width: 381
                height: 361
                rightPadding: 0
                spacing: 10
                leftPadding: 0
                padding: 0

                Text {
                    id: corners_component1
                    x: 20
                    text: qsTr("Corners : ")
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle2
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: corners_input1
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: dribbling_component1
                    x: 20
                    text: qsTr("Dribbling : ")
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle4
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: dribbling_input1
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component5
                    x: 20
                    text: qsTr("First Touch : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle6
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput5
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component7
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle8
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput7
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component9
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle10
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput9
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component11
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle12
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput11
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component13
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle14
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput13
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component15
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle16
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput15
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component17
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle18
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput17
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component26
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle27
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput26
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component27
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle28
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput27
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component28
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle29
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput28
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component29
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle30
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput29
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component30
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle31
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput30
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component31
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle32
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput31
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component32
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle33
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput32
                        x: 239
                        y: 8
                        width: 105
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component33
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle34
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput33
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: crossing_component37
                    x: 20
                    text: qsTr("Crossing : ")
                    font.pixelSize: 30
                    rotation: -0.464
                    font.bold: true
                    Rectangle {
                        id: rectangle38
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        color: "#ffffff"
                    }

                    TextInput {
                        id: textInput37
                        x: 240
                        y: 8
                        width: 104
                        height: 34
                        font.pixelSize: 12
                    }
                }

            }



        }

    }
}
