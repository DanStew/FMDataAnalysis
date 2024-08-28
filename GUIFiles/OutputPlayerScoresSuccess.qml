import QtQuick 6.0
import QtQuick.Controls 2.1
import QtQuick.Window 2.1
import QtQuick.Controls.Material 2.1

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

    Component {
        id: rect

        Rectangle {
            id: root
            width: 800
            height: 600
            color: "#fff1bb"

            Text {
                id: text1
                x: 0
                y: 93
                width: 800
                height: 173
                text: qsTr("Player Scores successfully generated and outputted")
                font.pixelSize: 60
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                font.bold: true

                Button {
                    id: button
                    x: 168
                    y: 192
                    width: 464
                    height: 146
                    text: qsTr("Return to Main Menu")
                    font.bold: true
                    font.pointSize: 30
                    onClicked : loader.source = "MainWindow.qml"
                }
            }
        }
    }
}
