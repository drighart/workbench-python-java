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
        "terminal.foreground":"#B8BBC2",
        "terminalCursor.background":"#B8BBC2",
        "terminalCursor.foreground":"#B8BBC2",
        "terminal.ansiBlack":"#061229",
        "terminal.ansiBlue":"#151515",
        "terminal.ansiBrightBlack":"#717885",
        "terminal.ansiBrightBlue":"#5299BF",
        "terminal.ansiBrightCyan":"#72B9BF",
        "terminal.ansiBrightGreen":"#99BF52",
        "terminal.ansiBrightMagenta":"#9989CC",
        "terminal.ansiBrightRed":"#D07346",
        "terminal.ansiBrightWhite":"#FFFFFF",
        "terminal.ansiBrightYellow":"#FBD461",
        "terminal.ansiCyan":"#72B9BF",
        "terminal.ansiGreen":"#99BF52",
        "terminal.ansiMagenta":"#9989CC",
        "terminal.ansiRed":"#D07346",
        "terminal.ansiWhite":"#B8BBC2",
        "terminal.ansiYellow":"#FBD461"
    },
    "rust.mode": null
}
```

Based on: https://glitchbone.github.io/vscode-base16-term/#/phd
