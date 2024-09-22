import "Misc/PropellerGauge"
import "Misc/TankGauge"
import "Misc/TemperaturePressureGauge"
import "Misc/VacAmpGauge"
import "Misc/EgtFuelFlowGauge"

import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.0

Window {
    id: window
    visible: true
    minimumWidth: 800
    minimumHeight: 600
    visibility: Window.Maximized
    title: "Miscellaneous Gauges Example"
    color: "#ffffff"

    FontLoader {
        source: "qrc:/Resources/Fonts/CenturyGothic.ttf"
    }
    property double scaleRatio: Math.min(height / 1080, width / 1920)
    property double radius: 250 * scaleRatio

    Grid {
        columns: 3
        columnSpacing: 48
        rowSpacing: 8

        anchors {
            centerIn: parent
            margins: 16
        }

        TankGauge {
            radius: window.radius
            leftTankFuel: pfd.leftTankFuel
            rightTankFuel: pfd.rightTankFuel
        }

        EgtFuelFlowGauge {
            radius: window.radius
            egt: pfd.egt
            fuelFlow: pfd.fuelFlow
        }

        PropellerGauge {
            radius: window.radius
            rpm: pfd.rpm
        }

        VacAmpGauge {
            radius: window.radius
            vac: pfd.vac
            amp: pfd.amp
        }

        TemperaturePressureGauge {
            radius: window.radius
            engineTemperature: pfd.engineTemperature
            enginePressure: pfd.enginePressure
        }
    }
}
