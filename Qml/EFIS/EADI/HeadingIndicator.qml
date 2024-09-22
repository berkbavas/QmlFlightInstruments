import QtQuick 2.15

Item {
    width: 300
    height: 300
    clip: true

    property double heading: 0
    property double bugValue: 0

    CustomImage {
        id: back
        x: 0
        y: 210
        height: 90
        source: "qrc:/Resources/Images/eadi/eadi_hsi_back.svg"
        sourceSize.height: 450
        sourceSize.width: 1500
    }

    CustomImage {
        id: face
        x: 38
        y: 233
        width: 224
        source: "qrc:/Resources/Images/eadi/eadi_hsi_face.svg"
        sourceSize.height: 2240
        sourceSize.width: 2240

        transform: Rotation {
            origin.x: (150 - 38)
            origin.y: (345 - 233)
            axis {
                x: 0
                y: 0
                z: 1
            }
            angle: -heading
        }
    }

    CustomImage {
        id: bug
        x: 38
        y: 233
        width: 224
        source: "qrc:/Resources/Images/eadi/eadi_hsi_bug.svg"
        sourceSize.height: 2240
        sourceSize.width: 2240
        transform: Rotation {
            origin.x: (150 - 38)
            origin.y: (345 - 233)
            axis {
                x: 0
                y: 0
                z: 1
            }
            angle: -heading + bugValue
        }
    }

    CustomImage {
        id: marks
        x: 134
        y: 217
        height: 73
        source: "qrc:/Resources/Images/eadi/eadi_hsi_marks.svg"
        sourceSize.height: 730
        sourceSize.width: 320
    }

    Text {
        x: 136
        y: 219
        text: heading.toFixed(0)
        width: 28
        height: 14
        font.family: "Courier Std"
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        color: "#ffffff"
        antialiasing: true
    }
}
