import { App, Astal, Gtk } from "astal/gtk3"

// Una ventana que actúa como barra superior
const Bar = (monitor: number) => {
    return new Astal.Window({
        monitor,
        name: `bar-${monitor}`,
        anchor: Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT,
        exclusivity: Astal.Exclusivity.EXCLUSIVE,
        child: new Gtk.CenterBox({
            startWidget: new Gtk.Label({ label: "Mi Shell" }),
            endWidget: new Gtk.Button({
                label: "Salir",
                onClicked: () => App.quit(),
            }),
        }),
    })
}

App.start({
    main: () => {
        Bar(0) // Lanza la barra en el monitor 0
    },
})
