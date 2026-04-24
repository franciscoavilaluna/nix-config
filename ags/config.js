// ~/nix-config/ags/config.js
import App from 'resource:///com/github/Aylur/ags/app.js';

const myWidget = Widget.Label({
    label: '¡Mi entorno 100% programable!',
    className: 'hello-label',
});

const myWindow = Widget.Window({
    name: 'my-window',
    anchor: ['top'],
    child: myWidget,
});

App.config({
    windows: [myWindow],
});
