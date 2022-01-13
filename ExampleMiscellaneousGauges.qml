import "Misc/PropellerGauge"
import "Misc/TankGauge"
import "Misc/TemperaturePressureGauge"
import "Misc/VacAmpGauge"
import "Misc/EgtFuelFlowGauge"

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
        columns: 3

        anchors {
            fill: parent
            margins: 16
        }

        TankGauge {
            radius: 200
            leftTankFuel: pfd.leftTankFuel
            rightTankFuel: pfd.rightTankFuel
        }

        EgtFuelFlowGauge {
            radius: 200
            egt: pfd.egt
            fuelFlow: pfd.fuelFlow
        }

        PropellerGauge {
            radius: 200
            rpm: pfd.rpm
        }


        VacAmpGauge {
            radius: 200
            vac: pfd.vac
            amp: pfd.amp
        }

        TemperaturePressureGauge {
            radius: 200
            engineTemperature: pfd.engineTemperature
            enginePressure: pfd.enginePressure
        }

    }
}
