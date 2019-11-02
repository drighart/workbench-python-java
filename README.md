# Workbench Visual Studio

With support for Java, Node, Python

Build it, run it, ...

```bash
docker build -t drighart/workbench-python:latest .
docker push drighart/workbench-python:latest

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
