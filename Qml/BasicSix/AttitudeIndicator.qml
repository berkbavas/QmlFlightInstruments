import QtQuick 2.0

Item {
    width: 2 * radius
    height: 2 * radius

    required property double radius
    property double roll: 0
    property double pitch: 0
    readonly property double pixelPerDegree: 1.7

    property double deltaFaceX: 0
    property double deltaFaceY: 0

    onRollChanged: update()
    onPitchChanged: update()

    function update() {
        var tempPitch = pitch
        if (tempPitch < -20)
            tempPitch = -20
        if (tempPitch > 20)
            tempPitch = 20

        deltaFaceX = (face.width / 240) * pixelPerDegree * tempPitch * Math.sin(Math.PI * roll / 180.0)
        deltaFaceY = (face.height / 240) * pixelPerDegree * tempPitch * Math.cos(Math.PI * roll / 180.0)
    }

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/ai/ai_back.svg"
        rotation: -roll
    }

    CustomImage {
        id: face
        anchors.fill: parent
        source: "qrc:/Resources/Images/ai/ai_face.svg"

        transform: [
            Rotation {
                origin.x: 0.5 * face.width
                origin.y: 0.5 * face.height
                axis {
                    x: 0
                    y: 0
                    z: 1
                }
                angle: -roll
            },

            Translate {
                x: deltaFaceX
                y: deltaFaceY
            }
        ]
    }

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/ai/ai_ring.svg"
        rotation: -roll
    }

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/ai/ai_case.svg"
    }
}
