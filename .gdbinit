set index-cache enabled on
set print pretty on

set confirm off
set verbose off

python

import sys, os.path
sys.path.insert(0, os.path.expanduser('~/.gdb'))
import qt5printers
qt5printers.register_printers(gdb.current_objfile())

sys.path.insert(0, os.path.expanduser('~/.gdb/qgisprinters'))
import qgis
qgis.register_qgis_printers(None)

end
