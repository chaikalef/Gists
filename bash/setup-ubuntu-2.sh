#!/usr/bin/env bash
. ~/.bashrc && conda config --set auto_activate_base True && conda config --add channels conda-forge && conda config --add channels defaults && cc main python -y && ca main && cif && ca base && cc web python -y && ca web && ciw && ca base && cc tf python -y && ca tf && ciftc && ca base && cc torch python -y && ca torch && cifpg && ca main
