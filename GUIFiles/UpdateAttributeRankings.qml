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
                width: 771
                height: 361
                focusPolicy: Qt.NoFocus
                ScrollBar.vertical.policy: ScrollBar.AlwaysOn
                contentHeight: 900
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
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
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
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: first_touch_component
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
                            id: first_touch_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: heading_component
                        x: 20
                        text: qsTr("Heading : ")
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
                            id: heading_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: long_throws_component
                        x: 20
                        text: qsTr("Long Throws : ")
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
                            id: long_throws_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: passing_component
                        x: 20
                        text: qsTr("Passing : ")
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
                            id: passing_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: tackling_component
                        x: 20
                        text: qsTr("Tackling : ")
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
                            id: tackling_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: aggression_component
                        x: 20
                        text: qsTr("Aggression : ")
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
                            id: aggression_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: bravery_component
                        x: 20
                        text: qsTr("Bravery : ")
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
                            id: bravery_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: concentration_component
                        x: 20
                        text: qsTr("Concentration : ")
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
                            id: concentration_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: determination_component
                        x: 20
                        text: qsTr("Determination : ")
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
                            id: determination_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: leadership_component
                        x: 20
                        text: qsTr("Leadership : ")
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
                            id: leadership_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: positioning_component
                        x: 20
                        text: qsTr("Positioning : ")
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
                            id: positioning_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: vision_component
                        x: 20
                        text: qsTr("Vision : ")
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
                            id: vision_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: acceleration_component
                        x: 20
                        text: qsTr("Acceleration : ")
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
                            id: acceleration_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: balance_component
                        x: 20
                        text: qsTr("Balance : ")
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
                            id: balance_input
                            x: 239
                            y: 8
                            width: 105
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: natural_fitness_component
                        x: 20
                        text: qsTr("Natural Fitness : ")
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
                            id: natural_fitness_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: stamina_component
                        x: 20
                        text: qsTr("Stamina : ")
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
                            id: stamina_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
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
                        id: crossing_component
                        x: 20
                        text: qsTr("Crossing : ")
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
                            id: crossing_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: finishing_component
                        x: 20
                        text: qsTr("Finishing : ")
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
                            id: finishing_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: free_kicks_component
                        x: 20
                        text: qsTr("Free Kicks : ")
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
                            id: free_kicks_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: long_shots_component
                        x: 20
                        text: qsTr("Long Shots : ")
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
                            id: long_shots_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: marking_component
                        x: 20
                        text: qsTr("Marking : ")
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
                            id: marking_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: penalty_taking_component
                        x: 20
                        text: qsTr("Penalty Taking : ")
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
                            id: penalty_taking_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: technique_component
                        x: 20
                        text: qsTr("Technique : ")
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
                            id: technique_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: anticipation_component
                        x: 20
                        text: qsTr("Anticipation  : ")
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
                            id: anticipation_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: composure_component
                        x: 20
                        text: qsTr("Composure : ")
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
                            id: composure_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: decisions_component
                        x: 20
                        text: qsTr("Decisions : ")
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
                            id: decisions_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: flair_component
                        x: 20
                        text: qsTr("Flair : ")
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
                            id: flair_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: off_the_ball_component
                        x: 20
                        text: qsTr("Off The Ball : ")
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
                            id: off_the_ball_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: teamwork_component
                        x: 20
                        text: qsTr("Teamwork : ")
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
                            id: teamwork_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: work_rate_component
                        x: 20
                        text: qsTr("Work Rate : ")
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
                            id: work_rate_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: agility_component
                        x: 20
                        text: qsTr("Agility : ")
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
                            id: agility_input
                            x: 239
                            y: 8
                            width: 105
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: jumping_reach_component
                        x: 20
                        text: qsTr("Jumping Reach : ")
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
                            id: jumping_reach_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: pace_component
                        x: 20
                        text: qsTr("Pace : ")
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
                            id: pace_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        id: strength_component
                        x: 20
                        text: qsTr("Strength : ")
                        font.pixelSize: 30
                        rotation: -0.464
                        font.bold: true
                        Rectangle {
                            id: rectangle40
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            color: "#ffffff"
                        }

                        TextInput {
                            id: strength_input
                            x: 240
                            y: 8
                            width: 104
                            height: 34
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
        }
    }
}
