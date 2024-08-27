/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.7
import QtQuick.Controls 6.7
import MainWindow

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: "#fff1bb"

    Text {
        id: main_title_1
        x: 0
        y: 0
        width: 642
        height: 107
        text: qsTr("Football Manager")
        font.pixelSize: 60
        horizontalAlignment: Text.AlignHCenter
        padding: 20
        font.italic: true
        font.bold: true
    }

    Text {
        id: main_title_2
        x: 0
        y: 68
        width: 642
        height: 107
        text: qsTr("Player Analyser")
        font.pixelSize: 60
        horizontalAlignment: Text.AlignHCenter
        padding: 20
        font.italic: true
        font.bold: true
    }

    Button {
        id: generate_player_scores_button
        x: 67
        y: 206
        text: qsTr("Generate Player Scores")
        font.bold: true
        font.italic: true
        font.family: "Arial"
        font.pointSize: 32
        padding: 10
    }

    Button {
        id: update_attributes_rankings
        x: 38
        y: 308
        text: qsTr("Update Attribute Rankings")
        padding: 10
        font.pointSize: 32
        font.italic: true
        font.family: "Arial"
        font.bold: true
    }
    states: [
        State {
            name: "Generate Player Scores"
            when: generate_player_scores_button.pressed

            PropertyChanges {
                target: update_attributes_rankings
                visible: false
            }

            PropertyChanges {
                target: generate_player_scores_button
                checkable: true
            }
        }
    ]

}


