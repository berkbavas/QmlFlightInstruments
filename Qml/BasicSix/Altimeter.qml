import QtQuick 2.0

Item {
    width: 2 * radius
    height: 2 * radius

    required property double radius
    property double altitude: 0
    property double pressure: 28

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/alt/alt_face_1.svg"
        rotation: {
            let value = pressure

            if (value < 28.0)
                value = 28.0
            else if (value > 31.5)
                value = 31.5

            return (value - 28.0) * 100.0
        }
    }

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/alt/alt_face_2.svg"
    }

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/alt/alt_face_3.svg"
        rotation: 0.0036 * altitude
    }

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/alt/alt_hand_1.svg"
        rotation: 0.036 * altitude
    }

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/alt/alt_hand_2.svg"
        rotation: 0.36 * (altitude % 1000)
    }

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/alt/alt_case.svg"
    }
}
