import Quickshell
import Quickshell.QtQuick

ApplicationWindow {
    // Definimos el tamaño de la ventana
    width: 300
    height: 100
    visible: true
    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

    // Contenido del widget
    Rectangle {
        anchors.fill: parent
        color: "#282a36" // Color estilo Dracula
        radius: 10
        border.color: "#bd93f9"
        border.width: 2

        Text {
            anchors.centerIn: parent
            text: "¡Hola, NixOS!"
            color: "#f8f8f2"
            font.pixelSize: 20
        }
    }

    // Para cerrar la app fácilmente al probar: presiona ESC
    Shortcut {
        sequences: ["Escape"]
        onActivated: Qt.quit()
    }
}
