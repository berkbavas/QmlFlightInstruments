import QtQuick 2.0

Item {
    width: 300
    height: 300
    clip: true

    property double headingBug: 0
    property double course: 0
    property double distance: 0

    property string headingString: headingBug.toFixed(0)
    property string courseString: course.toFixed(0)

    // Heading Bug
    Text {
        x: 16
        y: 8
        font.family: "Courier Std"
        font.pixelSize: 16
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        color: "#ff00ff"
        antialiasing: true
        text: "HDG " + (headingString.length === 1 ? "00" + headingString : headingString.length === 2 ? "0" + headingString : headingString)
    }

    // Course
    Text {
        x: 216
        y: 8
        font.family: "Courier Std"
        font.pixelSize: 16
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        color: "#00ff00"
        antialiasing: true
        text: "CRS " + (courseString.length === 1 ? "00" + courseString : courseString.length === 2 ? "0" + courseString : courseString)
    }

    // Distance
    Text {
        x: 16
        y: 272
        width: 276
        height: 18
        font.family: "Courier Std"
        font.pixelSize: 16
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        color: "#ffffff"
        antialiasing: true
        text: distance.toFixed(1) + " NM"
    }
}
