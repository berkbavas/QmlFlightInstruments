import QtQuick 2.0

Item {
    width: 2 * radius
    height: 2 * radius

    required property double radius
    property double climbRate: 0

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/vsi/vsi_face.svg"
    }

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/vsi/vsi_case.svg"
    }

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/vsi/vsi_hand.svg"
        rotation: 8.6 * climbRate
    }
}
