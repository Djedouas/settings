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
import sys

def has_field(val, name):
    """Check whether @p val (gdb.Value) has a field named @p name"""
    try:
        val[name]
        return True
    except Exception:
        return False

def default_iterator(val):
    for field in val.type.fields():
        yield field.name, val[field.name]

class FunctionLookup:

    def __init__(self, gdb, pretty_printers_dict):
        self.gdb = gdb
        self.pretty_printers_dict = pretty_printers_dict

    def __call__(self, val):
        "Look-up and return a pretty-printer that can print val."

        # Get the type.
        type = val.type;

        # If it points to a reference, get the reference.
        if type.code == self.gdb.TYPE_CODE_REF:
            type = type.target ()

        # Get the unqualified type, stripped of typedefs.
        type = type.unqualified ().strip_typedefs ()

        # Get the type name.
        typename = type.tag
        if typename == None:
            return None

        # Iterate over local dictionary of types to determine
        # if a printer is registered for that type.  Return an
        # instantiation of the printer if found.
        for function in self.pretty_printers_dict:
            if function.search (typename):
                return self.pretty_printers_dict[function](val)

        # Cannot find a pretty printer.  Return None.
        return None

# END

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

