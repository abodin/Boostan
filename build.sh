#!/bin/bash

echo "building ${1}"
xelatex -synctex=1 ${1} &&
bibtex8 -W -c cp1256fa ${1} &&
xindy -L persian-variant3 -C utf8 -I xindy -M ${1}.xdy -t ${1}.glg -o ${1}.gls ${1}.glo &&
xindy -L persian-variant3 -C utf8 -I xindy -M ${1}.xdy -t ${1}.blg -o ${1}.bls ${1}.blo &&
xindy -L english -C utf8 -I xindy -M ${1}.xdy -t ${1}.alg -o ${1}.acr ${1}.acn &&
makeindex ${1} &&
xelatex -synctex=1 ${1} &&
xelatex -synctex=1 ${1}
