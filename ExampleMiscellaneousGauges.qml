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
    color: "#000000"


    FontLoader { source: "Resources/Fonts/CenturyGothic.ttf" }


    Grid {
        columns: 3

        anchors {
            centerIn: parent
            margins: 16
        }

        TankGauge {
            radius: 250
            leftTankFuel: pfd.leftTankFuel
            rightTankFuel: pfd.rightTankFuel
        }

        EgtFuelFlowGauge {
            radius: 250
            egt: pfd.egt
            fuelFlow: pfd.fuelFlow
        }

        PropellerGauge {
            radius: 250
            rpm: pfd.rpm
        }


        VacAmpGauge {
            radius: 250
            vac: pfd.vac
            amp: pfd.amp
        }

        TemperaturePressureGauge {
            radius: 250
            engineTemperature: pfd.engineTemperature
            enginePressure: pfd.enginePressure
        }
    }
}
