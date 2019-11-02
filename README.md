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
