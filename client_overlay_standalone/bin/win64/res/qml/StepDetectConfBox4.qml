import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

GroupBox {
    property string boxTitle: "Step Touch Pad Conf"

    property double walkTouch : 0.6
    property double jogTouch : 0.9
    property double runTouch : 1.0

    property double thresholdStep: 0.01

    property int keyboardUIDBase: 120

    property var setWalkTouch: function(w) {}
    property var setJogTouch: function(j) {}
    property var setRunTouch: function(r) {}
    property var updateValues: function() {}

    function updateGUI() {
        walkTouchInputField.text = walkTouch.toFixed(2)
        jogTouchInputField.text = jogTouch.toFixed(2)
        runTouchInputField.text = runTouch.toFixed(2)
    }

    Layout.fillWidth: true

    label: MyText {
        leftPadding: 10
        text: parent.boxTitle
        bottomPadding: -10
    }

    background: Rectangle {
        color: "transparent"
        border.color: "#ffffff"
        radius: 8
    }


    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            color: "#ffffff"
            height: 1
            width: 1100
            Layout.bottomMargin: 5
        }

        GridLayout {
            columns: 6

            MyText {
                text: "Walk Touch:"
                horizontalAlignment: Text.AlignHLeft
                Layout.preferredWidth: 230
            }

            MyText {
                text: "Jog Touch:"
                horizontalAlignment: Text.AlignHCenter
                Layout.preferredWidth: 230
            }

            MyText {
                text: "Run Touch:"
                horizontalAlignment: Text.AlignHCenter
                Layout.preferredWidth: 230
            }

            MyText {
                text: " "
                horizontalAlignment: Text.AlignHCenter
                Layout.preferredWidth: 230
            }
            MyText {
                text: " "
                horizontalAlignment: Text.AlignHCenter
                Layout.preferredWidth: 90
            }
            MyText {
                text: " "
                horizontalAlignment: Text.AlignHCenter
                Layout.preferredWidth: 90
            }

        }

        GridLayout {
            columns: 12

            MyPushButton2 {
                id: walkTouchMinusButton
                Layout.preferredWidth: 40
                text: "-"
                onClicked: {
                    var value = walkTouch - thresholdStep
                    if (value < -1) {
                        value = -1
                    }
                    walkTouch = value
                    setWalkTouch(value)
                }
            }

            MyTextField {
                id: walkTouchInputField
                text: "0.6"
                keyBoardUID: 120
                Layout.preferredWidth: 140
                horizontalAlignment: Text.AlignHCenter
                function onInputEvent(input) {
                    var val = parseFloat(input)
                    if (!isNaN(val)) {
                        if (val < -1) {
                            val = -1
                        } else if (val > 1.0) {
                            val = 1.0
                        }
                        walkTouch = val
                        setWalkTouch(val)
                    } 
                }
            }

            MyPushButton2 {
                id: walkTouchPlusButton
                Layout.preferredWidth: 40
                text: "+"
                onClicked: {
                    var value = walkTouch + thresholdStep
                    if (value > 1.0) {
                        value = 1.0
                    }
                    walkTouch = value  
                    setWalkTouch(value)                  
                }
            }

            MyPushButton2 {
                id: jogTouchMinusButton
                Layout.preferredWidth: 40
                text: "-"
                onClicked: {
                    var value = jogTouch - thresholdStep
                    if (value < -1) {
                        value = -1
                    }
                    jogTouch = value
                    setJogTouch(value)
                }
            }

            MyTextField {
                id: jogTouchInputField
                text: "0.9"
                keyBoardUID: 121
                Layout.preferredWidth: 140
                horizontalAlignment: Text.AlignHCenter
                function onInputEvent(input) {
                    var val = parseFloat(input)
                    if (!isNaN(val)) {
                        if (val < -1) {
                            val = -1
                        } else if (val > 1.0) {
                            val = 1.0
                        }
                        jogTouch = val
                        setJogTouch(val)
                    } 
                }
            }

            MyPushButton2 {
                id: jogTouchPlusButton
                Layout.preferredWidth: 40
                text: "+"
                onClicked: {
                    var value = jogTouch + thresholdStep
                    if (value > 1.0) {
                        value = 1.0
                    }
                    jogTouch = value
                    setJogTouch(value)
                }
            }

            MyPushButton2 {
                id: runTouchMinusButton
                Layout.preferredWidth: 40
                text: "-"
                onClicked: {
                    var value = runTouch - thresholdStep
                    if (value < -1) {
                        value = -1
                    }
                    runTouch = value
                    setRunTouch(value)
                }
            }

            MyTextField {
                id: runTouchInputField
                text: "1.0"
                keyBoardUID: 122
                Layout.preferredWidth: 140
                horizontalAlignment: Text.AlignHCenter
                function onInputEvent(input) {
                    var val = parseFloat(input)
                    if (!isNaN(val)) {
                        if (val < -1) {
                            val = -1
                        } else if (val > 1.0) {
                            val = 1.0
                        }
                        runTouch = val
                        setRunTouch(val)
                    } 
                }
            }

            MyPushButton2 {
                id: runTouchPlusButton
                Layout.preferredWidth: 40
                text: "+"
                onClicked: {
                    var value = runTouch + thresholdStep
                    if (value > 1.0) {
                        value = 1.0
                    }
                    runTouch = value
                    setRunTouch(value)
                }
            }

            MyText {
                text: " "
                Layout.preferredWidth: 160
            }

            MyText {
                text: " "
                Layout.preferredWidth: 90
            }

            MyText {
                text: " "
                Layout.preferredWidth: 90
            }

        }
    }
}
