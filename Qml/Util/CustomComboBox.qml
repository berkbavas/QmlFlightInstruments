import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ComboBox {
    id: control

    popup: Popup {
        y: control.height
        width: control.width
        implicitHeight: contentItem.implicitHeight + 2
        padding: 1

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex
        }

        background: Rectangle {
            border.color: "#cdcdcd"
            border.width: 1
        }
    }
}
