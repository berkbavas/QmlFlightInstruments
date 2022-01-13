import "Misc/PropellerGauge"
import "Misc/TankGauge"
import "Misc/TemperaturePressureGauge"
import "Misc/VacAmpGauge"

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

    GridLayout {
        columns: 2

        anchors {
            fill: parent
            margins: 16
        }

        TankGauge {
            radius: 200
        }

        PropellerGauge {
            radius: 200
        }

        TemperaturePressureGauge {
            radius: 200
        }

        VacAmpGauge {
            radius: 200
        }
    }
}
