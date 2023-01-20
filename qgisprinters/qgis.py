 # -*- coding: iso-8859-1 -*-
###########################################################################
#  qgis.py
#  --------------------------------------
#  Date                 : January 2023
#  Copyright            : (C) 2023 by Julien Cabieces
#  Email                : julien dot cabieces at oslandia dot com
###########################################################################
#                                                                         #
#   This program is free software; you can redistribute it and/or modify  #
#   it under the terms of the GNU General Public License as published by  #
#   the Free Software Foundation; either version 2 of the License, or     #
#   (at your option) any later version.                                   #
#                                                                         #
###########################################################################

import gdb
import itertools
import re
import time

from helper import *

class QgsGeometryPrinter:

    def __init__(self, val):
        self.val = val

    def to_string(self):
        return  gdb.parse_and_eval("reinterpret_cast<const QgsGeometry*>(%s)->asWkt(2)" % self.val.address)

    def display_hint (self):
        return 'string'

class QgsAbstractGeometryPrinter:

    def __init__(self, val):
        self.val = val

    def to_string(self):
        return gdb.parse_and_eval("reinterpret_cast<const QgsAbstractGeometry*>(%s)->asWkt(2)" % self.val.address)

    def display_hint (self):
        return 'string'

pretty_printers_dict = {}

def register_qgis_printers (obj):
    if obj == None:
        obj = gdb

    obj.pretty_printers.append(FunctionLookup(gdb, pretty_printers_dict))

def build_dictionary ():
    pretty_printers_dict[re.compile('^QgsGeometry$')] = lambda val: QgsGeometryPrinter(val)
    pretty_printers_dict[re.compile('^QgsPoint$')] = lambda val: QgsAbstractGeometryPrinter(val)
    pretty_printers_dict[re.compile('^QgsCurve$')] = lambda val: QgsAbstractGeometryPrinter(val)
    pretty_printers_dict[re.compile('^QgsGeometryCollection$')] = lambda val: QgsAbstractGeometryPrinter(val)
    pretty_printers_dict[re.compile('^QgsSurface$')] = lambda val: QgsAbstractGeometryPrinter(val)
    pretty_printers_dict[re.compile('^QgsLineString$')] = lambda val: QgsAbstractGeometryPrinter(val)
    pretty_printers_dict[re.compile('^QgsCurvePolygon$')] = lambda val: QgsAbstractGeometryPrinter(val)
    pretty_printers_dict[re.compile('^QgsPolygon$')] = lambda val: QgsAbstractGeometryPrinter(val)
    pretty_printers_dict[re.compile('^QgsTriangle$')] = lambda val: QgsAbstractGeometryPrinter(val)
    pretty_printers_dict[re.compile('^QgsMultiPoint$')] = lambda val: QgsAbstractGeometryPrinter(val)
    pretty_printers_dict[re.compile('^QgsMultiCurve$')] = lambda val: QgsAbstractGeometryPrinter(val)
    pretty_printers_dict[re.compile('^QgsMultiSurface$')] = lambda val: QgsAbstractGeometryPrinter(val)
    pretty_printers_dict[re.compile('^QgsCompoundCurve$')] = lambda val: QgsAbstractGeometryPrinter(val)
    pretty_printers_dict[re.compile('^QgsCircularString$')] = lambda val: QgsAbstractGeometryPrinter(val)
    


build_dictionary ()

