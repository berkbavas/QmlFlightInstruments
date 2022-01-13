import "Misc/PropellerGauge"
import "Misc/TankGauge"

import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.0

Window {
    visible: true
    minimumWidth: 800
    minimumHeight: 600
    visibility: Window.Maximized
    title: "Miscellaneous Gauges Example"
    color: "#ffffff"

    // Test

    GridLayout {
        columns: 2

        anchors {
            fill: parent
            margins: 16
        }

        TankGauge {
            radius: 300
        }

        PropellerGauge {
            radius: 300
        }
    }
}
