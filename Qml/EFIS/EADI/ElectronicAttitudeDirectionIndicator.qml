import QtQuick 2.0

Item {
    id: root
    width: 300
    height: 300

    property double scaleRatio: 1

    property alias adi: adi
    property alias asi: asi
    property alias hsi: hsi
    property alias vsi: vsi
    property alias alt: alt
    property alias labels: labels

    FontLoader {
        source: "qrc:/Resources/Fonts/Courier Std Bold.otf"
    }

    AttitudeIndicator {
        id: adi
        x: 0
        y: 0
    }

    AirspeedIndicator {
        id: asi
        x: 0
        y: 0
        scaleRatio: root.scaleRatio
    }

    HeadingIndicator {
        id: hsi
    }

    VerticalSpeedIndicator {
        id: vsi
        x: 0
        y: 0
        scaleRatio: root.scaleRatio
    }

    Altimeter {
        id: alt
        x: 0
        y: 0
        scaleRatio: root.scaleRatio
    }

    Labels {
        id: labels
        x: 0
        y: 0
    }

    Rectangle {
        id: maskTop
        x: 0
        y: 0
        width: 300
        height: 6
        color: "#000000"
    }

    Rectangle {
        id: maskLeft
        x: 0
        y: 0
        width: 6
        height: 300
        color: "#000000"
    }

    Rectangle {
        id: maskRight
        x: 296
        y: 0
        width: 4
        height: 300
        color: "#000000"
    }

    Rectangle {
        id: maskBottom
        x: 0
        y: 290
        width: 300
        height: 10
        color: "#000000"
    }
}
