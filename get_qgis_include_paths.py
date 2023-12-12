import sys
from pathlib import Path

if len(sys.argv) != 2:
    print("Argument requis : le fichier build.ninja")
    sys.exit(-1)

include_paths_set = set()
with Path(sys.argv[1]).open("r") as filein:
    for line in filein.readlines():
        if not line.startswith("  INCLUDES = "):
            continue
        include_paths = line.strip().split(" ")[2:]
        for include_path in include_paths:
            if include_path == "-isystem":
                continue
            if include_path.startswith("-I"):
                include_path = include_path[2:]
            include_paths_set.add(include_path)
print(":".join(include_paths_set))
print(len(include_paths_set))
