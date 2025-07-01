import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 600
    height: 800
    title: "Hello QML"

    Text {
        anchors.centerIn: parent
        text: "Hello, World!"
        font.pixelSize: 24
    }
}
