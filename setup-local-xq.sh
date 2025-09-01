#!/bin/bash
set -e
cd
if [ ! -d ".local" ]; then
  mkdir ".local"
fi
if [ ! -d ".local/bin" ]; then
  mkdir ".local/bin"
fi
cd .local/bin
cat >xq <<'END_SRC'
#!/usr/bin/python3
# -*- coding: utf-8 -*-
import re
import sys
from yq import xq_cli
if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
    sys.exit(xq_cli())
END_SRC
chmod 500 xq
pip install yq

