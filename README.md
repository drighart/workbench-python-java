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

## Key for terminal
Het ingeven van ctrl+tilde is een lastige toetscombinatie. Gebruikt Ctrl+Alt+Z
Deze kun je instellen in de keybindings.

## Configure colors
Soms is de achtergrond van de terminal blauw. Dit kun je voorkomen door de setting
van ansiBlue goed te zetten. Je kunt de settings.json aanpassen:

```
{
    "terminal.integrated.rendererType": "dom",
    "workbench.iconTheme": "vscode-icons",
    "workbench.colorCustomizations" : {
        "terminal.background":"#151515",
        "terminal.foreground":"#E9E9F4",
        "terminalCursor.background":"#E9E9F4",
        "terminalCursor.foreground":"#E9E9F4",
        "terminal.ansiBlack":"#151515",
        "terminal.ansiBlue":"#151515",
        "terminal.ansiBrightBlack":"#626483",
        "terminal.ansiBrightBlue":"#62D6E8",
        "terminal.ansiBrightCyan":"#A1EFE4",
        "terminal.ansiBrightGreen":"#EBFF87",
        "terminal.ansiBrightMagenta":"#B45BCF",
        "terminal.ansiBrightRed":"#EA51B2",
        "terminal.ansiBrightWhite":"#F7F7FB",
        "terminal.ansiBrightYellow":"#00F769",
        "terminal.ansiCyan":"#A1EFE4",
        "terminal.ansiGreen":"#EBFF87",
        "terminal.ansiMagenta":"#B45BCF",
        "terminal.ansiRed":"#EA51B2",
        "terminal.ansiWhite":"#E9E9F4",
        "terminal.ansiYellow":"#00F769" 
    },
    "rust.mode": null
}
```

Based on: https://glitchbone.github.io/vscode-base16-term/#/dracula
