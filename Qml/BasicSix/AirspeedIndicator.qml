import QtQuick 2.0

Item {
    width: 2 * radius
    height: 2 * radius

    required property double radius
    property double airspeed: 0
    property double angle: 0

    onAirspeedChanged: update()

    function update() {
        angle = airspeed

        if (angle < 0.0)
            angle = 0.0
        else if (angle > 235.0)
            angle = 235.0

        if (angle < 40.0)
            angle = 0.9 * angle
        else if (angle < 70.0)
            angle = 36.0 + 1.8 * (angle - 40.0)
        else if (angle < 130.0)
            angle = 90.0 + 2.0 * (angle - 70.0)
        else if (angle < 160.0)
            angle = 210.0 + 1.8 * (angle - 130.0)
        else
            angle = 264.0 + 1.2 * (angle - 160.0)
    }

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/asi/asi_face.svg"
    }

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/asi/asi_case.svg"
    }

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/asi/asi_hand.svg"
        rotation: angle
    }
}
