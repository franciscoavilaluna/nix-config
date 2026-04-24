import { App, Astal, Gtk, Gdk } from "astal/gtk3"

// Creamos una ventana simple
const MyWindow = () => {
    return new Astal.Window({
        name: "test-window",
        anchor: Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT,
        exclusivity: Astal.Exclusivity.NORMAL,
        child: new Gtk.Button({
            label: "¡Hola NixOS! Clic aquí para salir",
            onClicked: () => App.quit(),
            halign: Gtk.Align.CENTER,
            valign: Gtk.Align.CENTER,
        }),
    })
}

// Inicializamos la aplicación
App.start({
    requestHandler: (request, res) => {
        print(`Recibí: ${request}`)
        res("¡Recibido!")
    },
    main: () => {
        MyWindow()
    },
})
