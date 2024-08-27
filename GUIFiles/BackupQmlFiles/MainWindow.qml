import QtQuick 6.0
import QtQuick.Controls 2.1
import QtQuick.Window 2.1
import QtQuick.Controls.Material 2.1
import io.qt.textproperties

Item {
    id: root
    width: 800
    height: 600

    QmlSlots{
        id : qmlSlots
    }

    Loader{
        id : loader
        anchors.fill : parent
        sourceComponent : rect
    }

    Component{
        id :rect

        Rectangle {
            id: rectangle
            x: 0
            y: 0
            width: 800
            height: 600
            color: "#fff1bb"

            Text {
                id: main_title_1
                x: 46
                y: 0
                text: qsTr("Football Manager")
                font.pixelSize: 80
                padding: 20
                font.family: "Arial"
                font.italic: true
                font.bold: true
            }

            Button {
                id: generate_player_scores_button
                x: 62
                y: 249
                text: qsTr("Generate Player Scores")
                padding: 10
                font.italic: true
                font.bold: true
                font.pointSize: 42

                MouseArea {
                    anchors.fill: parent
                    cursorShape : Qt.PointingHandCursor
                    onClicked : loader.source = "GenerateAttributeRankings.qml"
                }
            }

            Text {
                id: main_title_2
                x: 78
                y: 108
                text: qsTr("Player Analyser")
                font.pixelSize: 80
                padding: 20
                font.italic: true
                font.family: "Arial"
                font.bold: true
            }

            Button {
                id: update_attributes_button
                x: 38
                y: 389
                text: qsTr("Update Attribute Rankings")
                padding: 10
                font.pointSize: 42
                font.italic: true
                font.bold: true

                MouseArea {
                    anchors.fill: parent
                    cursorShape : Qt.PointingHandCursor
                }
            }
        }
    }
}
