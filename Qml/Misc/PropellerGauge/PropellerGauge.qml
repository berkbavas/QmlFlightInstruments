import "../../Misc/Util"

import QtQuick 2.15
import QtQuick.Extras 1.4

Item {
    property double radius: 300
    property double rpm: 0

    width: 2 * radius
    height: 2 * radius

    CircularGauge {
        width: 2 * parent.radius
        height: 2 * parent.radius
        anchors.centerIn: parent
        scale: 0.775
        minimumValue: 0
        maximumValue: 3500
        stepSize: 1
        value: rpm
        style: PropellerGaugeStyle {}
    }

    CustomImage {
        anchors.fill: parent
        source: "qrc:/Resources/Images/misc/case.svg"
    }
}
