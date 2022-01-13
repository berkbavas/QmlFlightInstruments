import QtQuick 2.0

Item {
    width: 2 * radius
    height: 2 * radius

    required property double radius
    property double heading: 0

    CustomImage {
        anchors.fill: parent
        source: "../Resources/hi/hi_face.svg"
        rotation: -heading
    }

    CustomImage {
        anchors.fill: parent
        source: "../Resources/hi/hi_case.svg"
    }
}
