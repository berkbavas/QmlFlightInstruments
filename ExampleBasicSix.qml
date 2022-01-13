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

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            AirspeedIndicator {
                radius: 0.5 * Math.min(parent.width, parent.height)
                airspeed: pfd.airspeed
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            AttitudeIndicator {
                radius: 0.5 * Math.min(parent.width, parent.height)
                roll: pfd.roll
                pitch: pfd.pitch
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Altimeter {
                radius: 0.5 * Math.min(parent.width, parent.height)
                altitude: pfd.altitude
                pressure: pfd.pressure
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            TurnCoordinator {
                radius: 0.5 * Math.min(parent.width, parent.height)
                turnRate: pfd.turnRate
                slipSkid: pfd.slipSkid
            }
        }


        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            HeadingIndicator {
                radius: 0.5 * Math.min(parent.width, parent.height)
                heading: pfd.heading
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            VerticalSpeedIndicator {
                radius: 0.5 * Math.min(parent.width, parent.height)
                climbRate: pfd.climbRate
            }
        }
    }
}
