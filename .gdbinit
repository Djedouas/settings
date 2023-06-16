set index-cache enabled on
set print pretty on

set confirm off
set verbose off

# Because of a pain in the ass issue but I don't remember what handle SIG33 pass nostop noprint
handle SIG33 pass nostop noprint

python

import sys, os.path
sys.path.insert(0, os.path.expanduser('~/.gdb'))
import qt5printers
qt5printers.register_printers(gdb.current_objfile())

sys.path.insert(0, os.path.expanduser('~/.gdb/qgisprinters'))
import qgis
qgis.register_qgis_printers(None)

end
