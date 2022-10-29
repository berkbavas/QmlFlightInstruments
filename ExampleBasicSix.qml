import "BasicSix"

import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.0

Window {
    visible: true
    minimumWidth: 800
    minimumHeight: 600
    visibility: Window.Maximized
    title: "Basic Six Example"
    color: "#ffffff"

    GridLayout {
        columns: 3

        anchors {
            fill: parent
            margins: 16
        }

        AirspeedIndicator {
            radius: 200
            airspeed: pfd.airspeed
        }

        AttitudeIndicator {
            radius: 200
            roll: pfd.roll
            pitch: pfd.pitch
        }


        Altimeter {
            radius: 200
            altitude: pfd.altitude
            pressure: pfd.pressure
        }

        TurnCoordinator {
            radius: 200
            turnRate: pfd.turnRate
            slipSkid: pfd.slipSkid
        }


        HeadingIndicator {
            radius: 200
            heading: pfd.heading
        }


        VerticalSpeedIndicator {
            radius:200
            climbRate: pfd.climbRate
        }

    }
}
