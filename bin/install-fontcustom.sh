#!/bin/bash

set -e

sudo apt-get install -qq fontforge
wget http://people.mozilla.com/~jkew/woff/woff-code-latest.zip -O woff-code.zip
unzip woff-code.zip -d sfnt2woff
cd sfnt2woff
make
sudo mv sfnt2woff /usr/local/bin/
gem install fontcustom
