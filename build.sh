#!/usr/bin/env bash
# Usage: ./build.sh applications/<Company>_<Position>
set -e
cd "$1" && latexmk -pdf -interaction=nonstopmode cv.tex && latexmk -c
