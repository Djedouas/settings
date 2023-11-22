# settings

Fichiers de configuration

# lldb pretty printers qt et vimspector

Ajouter ces 2 lignes dans le fichier /home/jacky/.local/share/lunarvim/site/pack/lazy/opt/vimspector/gadgets/linux/download/CodeLLDB/v1.9.2/root/extension/formatters/__init__.py

```python
import lldb
lldb.debugger.HandleCommand("command script import /home/jacky/.settings/lldb-qt-formatters/lldbbridge.py")
```
