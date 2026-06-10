import QtQuick
import QtQuick.Controls

ApplicationWindow {
  visible: true
  title: "Calculator"
  color: "#1a1a1a"
  width: 400
  height: 600

  maximumWidth: 400
  maximumHeight: 600
  minimumWidth: 400
  minimumHeight: 600


  property real displayText: 0
  property string minimized: ""

  Label {
    x: 0
    anchors.horizontalCenter: parent.horizontalCenter
    y: 5

    text: "Calculator"
    color: "#89807e"
  }

  Label {
    x: 0
    anchors.right: parent.right
    anchors.rightMargin: 20
    y: 225

    text: displayText
    color: "#ffffff"
    font.pixelSize: 40
  }

  property var buttons: [
    "C", "±", "%", "÷",
    "7", "8", "9", "×",
    "4", "5", "6", "-",
    "1", "2", "3", "+",
    "0", ".", "00", "="
  ]

  Grid {
    columns: 4
    spacing: 8

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 20

    Repeater {
      model: buttons
      Button {
        width: 85
        height: 50
        text: modelData
        onClicked: handleButtonClick(displayText += modelData)
      }
    }
  }
}
