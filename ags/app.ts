import { App, Gtk, Gdk } from "astal/gtk3"

// Definimos la función de la barra
function Bar(monitor: Gdk.Monitor) {
    // 1. Creamos el botón primero
    const btn = new Gtk.Button({
        label: "Salir"
    })

    // 2. Conectamos la señal "clicked" después de la creación
    btn.connect("clicked", () => {
        App.quit()
    })

    // 3. Retornamos la ventana usando el botón ya conectado
    return new Astal.Window({
        monitor,
        name: `bar-${monitor.get_connector()}`,
        anchor: Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT,
        exclusivity: Astal.Exclusivity.EXCLUSIVE,
        child: new Gtk.CenterBox({
            startWidget: new Gtk.Label({ label: "Shell de Hyprland" }),
            endWidget: btn
        }),
    })
}

// 4. Lanzamiento
App.start({
    main: () => {
        const display = Gdk.Display.get_default()!
        const monitors = display.get_n_monitors()
        for (let i = 0; i < monitors; i++) {
            Bar(display.get_monitor(i)!)
        }
    },
})
