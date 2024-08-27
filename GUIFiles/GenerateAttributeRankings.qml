import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Studio.Components

Rectangle {
    id: root
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
            text: qsTr("Enter File Name...")
            font.pixelSize: 30
            verticalAlignment: Text.AlignVCenter
            font.italic: true
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
    }

    Button {
        id: button1
        x: 188
        y: 290
        text: qsTr("Submit Latest File")
        font.family: "Arial"
        font.bold: true
        font.pointSize: 40
    }

    Text {
        id: error_message
        x: 98
        y: 482
        width: 604
        height: 96
        color: "#fe0808"
        text: qsTr("Text")
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.Wrap
        font.italic: true
        font.bold: true
    }

    Rectangle {
        id: return_background_1
        x: 0
        y: 0
        width: 200
        height: 54
        color: "#ff0000"

        Rectangle {
            id: return_background_2
            x: 149
            y: 0
            width: 114
            height: 54
            color: "#ff0000"
            radius: 27
        }

        TriangleItem {
            id: return_arrow_head
            x: -2
            y: 7
            width: 40
            height: 40
            rotation: 270
        }

        Text {
            id: return_arrow_stem
            x: 92
            y: 5
            width: 158
            height: 49
            color: "#ffffff"
            text: qsTr("Main Menu")
            font.pixelSize: 30
            font.bold: true
        }

        Rectangle {
            id: return_button_text
            x: 28
            y: 16
            width: 48
            height: 22
            color: "#ffffff"
        }

    }
}
