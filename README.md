# Workbench Visual Studio

With support for Java, Node, Python

Build it, run it, ...

```bash
docker build -t drighart/workbench-python:latest .
docker push drighart/workbench-python:latest
```

## Bug in Visual code
Op dit moment kun je geen double - of single quotes tikken. Dit kan verholpen
worden door de *Keybinding.json* aan te passen met:

```
// Place your key bindings in this file to override the defaultsauto[]
[
    {
        "key": "OEM_7",
        "command": "type",
        "args": { "text": "'" },
        "when": "editorTextFocus"
    },
    {
        "key": "shift+OEM_7",
        "command": "type",
        "args": { "text": "\"" },
        "when": "editorTextFocus"
    }
]
```

VS Code heeft een "Experimental Watcher" ingebouwd. Die lijkt beter te werken. Tenminste had ik vandaag nog geen problemen mee:
```
"files.useExperimentalFileWatcher": true
```

## Gebruik git
Per repo kan er een deploykey aangemaakt worden. Deze deploykey kan gegenereerd worden
met `ssh-keygen`

Voer configuratie uit:
```
git clone -c core.sshCommand="ssh -i ~/rust/id_github_rust" git@github.com:drighart/rust-kubernetes.git
git config --global user.email "david.righart@gmail.com"
git config --global user.name "drighart"
```

## Install Rust/cargo
Voer de volgende commando's uit:
```
curl https://sh.rustup.rs -sSf | sh
export PATH="$HOME/.cargo/bin:$PATH"
```

## Configure colors
Soms is de achtergrond van de terminal blauw. Dit kun je voorkomen door de setting
van ansiBlue goed te zetten. Je kunt de settings.json aanpassen:

```
{
    "terminal.integrated.rendererType": "dom",
    "workbench.iconTheme": "vscode-icons",
    "workbench.colorCustomizations" : {
        "terminal.background":"#151515",
        "terminal.foreground":"#D0D0D0",
        "terminalCursor.background":"#D0D0D0",
        "terminalCursor.foreground":"#D0D0D0",
        "terminal.ansiBlack":"#151515",
        "terminal.ansiBlue":"#151515",
        "terminal.ansiBrightBlack":"#505050",
        "terminal.ansiBrightBlue":"#6A9FB5",
        "terminal.ansiBrightCyan":"#75B5AA",
        "terminal.ansiBrightGreen":"#90A959",
        "terminal.ansiBrightMagenta":"#AA759F",
        "terminal.ansiBrightRed":"#AC4142",
        "terminal.ansiBrightWhite":"#F5F5F5",
        "terminal.ansiBrightYellow":"#F4BF75",
        "terminal.ansiCyan":"#75B5AA",
        "terminal.ansiGreen":"#90A959",
        "terminal.ansiMagenta":"#AA759F",
        "terminal.ansiRed":"#AC4142",
        "terminal.ansiWhite":"#D0D0D0",
        "terminal.ansiYellow":"#F4BF75"
    },
    "rust.mode": null
}
```
