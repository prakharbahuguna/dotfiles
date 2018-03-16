#!/bin/bash

if command -v code > /dev/null; then
    if [ "$(uname)" = "Darwin" ]; then
        VSCODE_DIR="${HOME}/Library/Application Support/Code/User"
    else
        VSCODE_DIR="${HOME}/.config/Code"
    fi

    [ ! -d "${VSCODE_DIR}" ] && mkdir -p "${VSCODE_DIR}"
    cp settings.json "${VSCODE_DIR}"

    extensions=(MS-DevSkim.vscode-devskim RReverser.llvm
                dracula-theme.theme-dracula eamodio.gitlens fallenwood.vimL
                krvajalm.linter-gfortran ms-python.python ms-vscode.cpptools
                llvm.tablegen timonwong.shellcheck)

    for ext in "${extensions[@]}"; do
        code --install-extension "${ext}" || true
    done
fi
