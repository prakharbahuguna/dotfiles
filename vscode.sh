#!/bin/bash

if command -v code > /dev/null; then
    if [ "$(uname)" = "Darwin" ]; then
        VSCODE_DIR="${HOME}/Library/Application Support/Code/User"
    else
        VSCODE_DIR="${HOME}/.config/Code"
    fi

    [ ! -d "${VSCODE_DIR}" ] && mkdir -p "${VSCODE_DIR}"
    cp settings.json "${VSCODE_DIR}"

    extensions=(
        CoenraadS.bracket-pair-colorizer-2
        eamodio.gitlens
        EditorConfig.EditorConfig
        Equinusocio.vsc-material-theme
        fallenwood.vimL
        krvajalm.linter-gfortran
        liximomo.sftp
        mechatroner.rainbow-csv
        ms-azuretools.vscode-docker
        ms-python.python
        ms-vscode.cpptools
        PKief.material-icon-theme
        timonwong.shellcheck
    )

    for ext in "${extensions[@]}"; do
        code --install-extension "${ext}" || true
    done
fi
