import { App, Astal, Gtk } from "astal/gtk3"
import Hyprland from "gi://AstalHyprland"

const hypr = Hyprland.get_default()

const WindowList = () => {
    const box = new Gtk.Box({ vertical: true })
    
    // Escucha eventos de Hyprland
    hypr.connect("client-added", () => {
        print("Nueva ventana abierta")
    })

    return new Astal.Window({
        child: new Gtk.Label({ label: "Shell de Hyprland activo" })
    })
}

App.start({ main: () => WindowList() })
