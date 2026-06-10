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

  property var displayText: "0"

  // ── Shared handler used by BOTH keyboard and buttons ──────────
  function handleButton(btn) {
    switch (btn) {
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
        var ops = ["+", "-", "×", "÷"]
        if (displayText === "0") {
          displayText = btn
        } else if (ops.includes(btn) &&
            ops.includes(displayText[displayText.length - 1])) {
          displayText = displayText.slice(0, -1) + btn
        } else {
          displayText += btn
        }
        break
    }
  }

  function calculate(expression) {
    var clean = expression
        .replace(/×/g, "*")
        .replace(/÷/g, "/")
    return eval(clean)
  }
  // ─────────────────────────────────────────────────────────────

  Item {
    id: keyHandler
    focus: true

    Keys.onPressed: (event) => {
      var input = event.text

      if ("0123456789.+-".includes(input)) {
        handleButton(input)
      } else if (input === "*") {
        handleButton("×")
      } else if (input === "/") {
        handleButton("÷")
      } else if (input === "%" ) {
        handleButton("%")
      } else if (input === "c" || input === "C") {
        handleButton("C")
      } else {
        switch (event.key) {
          case Qt.Key_Return:
          case Qt.Key_Enter:
          case Qt.Key_Equal:     handleButton("=");  break
          case Qt.Key_Backspace: handleButton("⌫"); break
          case Qt.Key_Escape:    handleButton("C");  break
        }
      }
      event.accepted = true
    }
  }

  Label {
    anchors.horizontalCenter: parent.horizontalCenter
    y: 5
    text: "Calculator"
    color: "#89807e"
  }

  Label {
    anchors.right: parent.right
    anchors.rightMargin: 20
    y: 175
    text: displayText
    color: "#ffffff"
    font.pixelSize: 40
  }

  property var buttons: [
    "C", "±", "⌫", "÷",
    "7", "8", "9",  "×",
    "4", "5", "6",  "-",
    "1", "2", "3",  "+",
    "0", ".", "%",  "="
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
          color: if (modelData === "+" || modelData === "×" ||
            modelData === "-" || modelData === "÷" ||
            modelData === "=") { "#ff9f0a"
            } else if (modelData === "C" || modelData === "±" || modelData === "⌫") {
            '#999898'
            } else {
            "#d5cdcb"
            }
        }

        onClicked: {
          handleButton(modelData)
          keyHandler.forceActiveFocus()  // reclaim keyboard focus after click
        }
      }
    }
  }
}
