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

  Label {
    x: 0
    anchors.horizontalCenter: parent.horizontalCenter
    y: 5

    text: "Calculator"
    color: "#89807e"
  }

  property var displayText: "0"

  Label {
    x: 0
    anchors.right: parent.right
    anchors.rightMargin: 20
    y: 175

    text: displayText
    color: "#ffffff"
    font.pixelSize: 40
  }

  property var buttons: [
    "C", "±", "⌫", "÷",
    "7", "8", "9", "×",
    "4", "5", "6", "-",
    "1", "2", "3", "+",
    "0", ".", "%", "="
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
        height: 60
        font.pixelSize: 20
        text: modelData

        background: Rectangle {
          color: (modelData === "+" || modelData === "×" ||
            modelData === "-" || modelData === "÷" ||
            modelData === "=") ? "#ff9f0a" : "#d5cdcb"

          // color: (modelData === "C" || modelData === "±" || modelData === "⌫" ||
          //   modelData === "%") ? "#ff9f0a" : "#d5cdcb"
        }

        onClicked: {
          switch (modelData) {
            case "C":
              displayText = "0"
              break

            case "=":
              try {
                displayText = calculate(displayText).toString()
              } catch (e) {
                displayText = "Error"
              }
              break
            
            case "±":
              if (displayText !== "0") {
                if (displayText.startsWith("-")) {
                  displayText = displayText.substring(1)
                } else {
                  displayText = "-" + displayText
                }
              }
              break

            case "⌫":
              if (displayText.length > 1) {
                displayText = displayText.slice(0, -1)
              } else {
                displayText = "0"
              }
              break

            default:
              if (displayText === "0") {
                displayText = modelData
              } else if ((modelData === "+" || modelData === "-" || modelData === "×" || modelData === "÷") &&
                  (displayText[displayText.length - 1] === "+" ||
                  displayText[displayText.length - 1] === "-" ||
                  displayText[displayText.length - 1] === "×" ||
                  displayText[displayText.length - 1] === "÷")) {
                displayText = displayText.slice(0, -1) + modelData
              } else {
                displayText += modelData
              }
              break
          }
        }
      }
    }
  }

  function calculate(expression) {
    // replace × and ÷ with * and /
    var clean = expression
        .replace(/×/g, "*")
        .replace(/÷/g, "/")

    return eval(clean)  // now safe-ish since you control the input
}

}

