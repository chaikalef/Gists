#!/usr/bin/env bash
cat << EOT >> .bashrc
# User specific aliases and functions
alias cls='clear '
alias gcl='git clone '
alias gs='git status '
alias gl='git log '
alias gd='git diff '
alias ga='git add '
alias gr='git reset '
alias gc='git commit -m '
alias gb='git branch '
alias gf='git log —follow — '
alias gg='git log —all —graph —decorate '
alias gch='git checkout '
alias gpu='git push '
alias gpl='git pull '
alias gbf="git rev-list --objects --all | git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' | awk '/^blob/ {print substr($0,6)}' | sort --numeric-sort --key=2 | tail | cut --complement --characters=13-40 | numfmt --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest "
alias tb='tensorboard --logdir=. '
alias ap='autopep8 -r --in-place . '
alias pi='pip install -e . '
alias ca='conda activate '
alias cak='conda activate keras '
alias cab='conda activate base '
alias cac='conda activate cpp '
alias cu='conda update '
alias ci='conda install '
alias cl='conda list '
alias cs='conda search '
alias cc='conda create -n '
alias cel='conda env list '
alias cu='conda uninstall '
alias cr='conda env remove -n '
alias cutp='conda uninstall tensorflow keras tensorflow-gpu keras-gpu tensorboard pytorch torchvision cudatoolkit pytorch-cpu torchvision-cpu -y '
alias citc='conda install tensorflow keras tensorboard -y '
alias citg='conda install tensorflow-gpu keras-gpu tensorboard -y '
alias cic='conda install valgrind gcc conda git cmake make cython -y '
alias cib='conda install jupyter yapf jupyter_contrib_nbextensions autopep8 pandas matplotlib qt pyqt pyqtgraph ipython conda numpy pip python opencv git pillow cmake make cython -y '
alias cif='conda install jupyter yapf jupyter_contrib_nbextensions autopep8 pandas matplotlib qt pyqt pyqtgraph conda numpy pip python opencv git pillow cmake make cython click flake8 mypy pydocstyle pytest pylint pep8 seaborn numba setuptools sortedcollections sortedcontainers typing pyinstaller h5py -y '
alias ciw='conda install jupyter yapf jupyter_contrib_nbextensions autopep8 pandas matplotlib qt pyqt pyqtgraph conda numpy pip python opencv git pillow cmake make cython click flask gunicorn uvicorn marshmallow fastapi flasgger flake8 mypy pydocstyle pytest pylint pep8 seaborn numba setuptools sortedcollections sortedcontainers typing pyinstaller h5py -y '
alias ciftc='conda install tensorflow keras tensorboard jupyter yapf jupyter_contrib_nbextensions autopep8 pandas matplotlib qt pyqt pyqtgraph conda numpy pip python opencv git pillow cmake make cython click flask flake8 mypy pydocstyle pytest pylint pep8 seaborn numba setuptools sortedcollections sortedcontainers typing pyinstaller h5py -y '
alias ciftg='conda install tensorflow-gpu keras-gpu tensorboard jupyter yapf jupyter_contrib_nbextensions autopep8 pandas matplotlib qt pyqt pyqtgraph conda numpy pip python opencv git pillow cmake make cython click flask flake8 mypy pydocstyle pytest pylint pep8 seaborn numba setuptools sortedcollections sortedcontainers typing pyinstaller h5py -y '
alias cipc='conda install pytorch-cpu torchvision-cpu -y '
alias cipg='conda install pytorch torchvision -y '
alias cifpc='conda install pytorch-cpu torchvision-cpu jupyter yapf jupyter_contrib_nbextensions autopep8 pandas matplotlib qt pyqt pyqtgraph conda numpy pip python opencv git pillow cmake make cython click flask flake8 mypy pydocstyle pytest pylint pep8 seaborn numba setuptools sortedcollections sortedcontainers typing pyinstaller h5py -y '
alias cifpg='conda install pytorch torchvision jupyter yapf jupyter_contrib_nbextensions autopep8 pandas matplotlib qt pyqt pyqtgraph conda numpy pip python opencv git pillow cmake make cython click flask flake8 mypy pydocstyle pytest pylint pep8 seaborn numba setuptools sortedcollections sortedcontainers typing pyinstaller h5py -y '
alias sa='source ~/anaconda3/bin/activate '
EOT
. ~/.bashrc && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && sudo apt update && sudo apt install google-chrome-stable git flameshot -y && sudo snap install zoom-client drawio gimp vlc || sudo snap install code --classic || sudo snap install slack --classic || code --install-extension ms-python.anaconda-extension-pack && code --install-extension donjayamanne.githistory && code --install-extension eamodio.gitlens && code --install-extension mhutchie.git-graph && code --install-extension ms-ceintl.vscode-language-pack-ru && code --install-extension streetsidesoftware.code-spell-checker-russian && code --install-extension adamvoss.vscode-languagetool-ru && code --install-extension kiteco.kite && code --install-extension davidanson.vscode-markdownlint && code --install-extension streetsidesoftware.code-spell-checker
