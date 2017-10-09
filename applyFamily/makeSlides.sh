#!/bin/bash

JUPYTER='/cygdrive/c/Anaconda3/Scripts/jupyter.exe'

pushd '/cygdrive/e/Repos/Notebooks/applyFamily'

# check if file exists, if so, delete it =>
if [ -e applyFamily-Test.ipynb ]
then
    rm -f applyFamilt-Test.ipynb
else
    echo 'applyFamilt-Test.ipynb not present...'
fi

# check if html file exists, if so, delete it =>
if [ -e applyFamily-Test.slides.html ]
then
    rm -f applyFamily-Test.slides.html
else
    echo "applyFamily-Test.slides.html not present..."
fi

# copy notebook from ghpages repository =>
cp '/cygdrive/e/Repos/ghpages/Notebooks/applyFamily-Test.ipynb' .

# generate slides =>
# $JUPYTER nbconvert applyFamily-Test.ipynb --to slides --post serve

$JUPYTER nbconvert applyFamily-Test.ipynb --to slides --reveal-prefix reveal.js-master

/cygdrive/c/Anaconda3/python.exe -m http.server 8001 --bind 127.0.0.1

