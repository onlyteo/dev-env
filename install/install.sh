#!/bin/bash

SCRIPT_FILE="$0"
if [ -L "${SCRIPT_FILE}" ]; then
   SCRIPT_DIR="$(dirname "$(readlink -f "${SCRIPT_FILE}")")"
else
   SCRIPT_DIR="$(cd "$(dirname "${SCRIPT_FILE}")" && pwd)"
fi
BIN_DIR="$(cd ${SCRIPT_DIR}/../bin && pwd)"

FONTS=(
    "MesloLGS%20NF%20Regular.ttf"
    "MesloLGS%20NF%20Bold.ttf"
    "MesloLGS%20NF%20Italic.ttf"
    "MesloLGS%20NF%20Bold%20Italic.ttf"
)

ZSH_THEMES=(
    "https://github.com/romkatv/powerlevel10k.git"
)

ZSH_PLUGINS=(
    "https://github.com/zsh-users/zsh-autosuggestions.git"
    "https://github.com/zsh-users/zsh-syntax-highlighting.git"
)

FONTS_DIR="${HOME}/.local/share/fonts"
OH_MY_ZSH_DIR="${HOME}/.oh-my-zsh"
ZSH_THEMES_DIR="${OH_MY_ZSH_DIR}/custom/themes"
ZSH_PLUGINS_DIR="${OH_MY_ZSH_DIR}/custom/plugins"
REBUILD_FONT_CACHE="1"

if [ ! -d "${FONTS_DIR}" ]; then
    echo "Creating fonts folder ${FONTS_DIR}"
    mkdir -p "${FONTS_DIR}"
fi

for font in "${FONTS[@]}"
do
    if [ -f "${FONTS_DIR}/${font}" ]; then
        echo "Font ${font} already exists"
    else
        echo "Downloading font ${font} to ${FONTS_DIR}"
        url="https://github.com/romkatv/powerlevel10k-media/raw/master/${font}"
        curl -SLo "${FONTS_DIR}/${font}" "${url}"
        REBUILD_FONT_CACHE="0"
    fi
done

if [ "${REBUILD_FONT_CACHE}" -eq "0" ]; then
    echo "Rebuilding font cache"
    fc-cache -f -v > /dev/null
fi

if [ -d "${OH_MY_ZSH_DIR}" ]; then
    echo "Oh-My-ZSH already installed"
else
    echo "Installing Oh-My-ZSH"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

for theme in "${ZSH_THEMES[@]}"
do
    if [[ ${theme} =~ ^.*\/([a-zA-Z0-9_-]+)\.git$ ]]; then
        theme_dir="${BASH_REMATCH[1]}"
        if [ -z "${theme_dir}" ]; then
            echo "Matching ZSH theme name from repo ${theme} produces empty result"
        elif [ -d "${ZSH_THEMES_DIR}/${theme_dir}" ]; then
            echo "ZSH theme ${theme_dir} already exists"
        else
            echo "Clone ZSH theme repo ${theme} to ${ZSH_THEMES_DIR}"
            git -q clone "${theme}" "${ZSH_THEMES_DIR}/${theme_dir}"
        fi
    else
        echo "Could not match ZSH theme name from repo ${theme}"
    fi
done

for plugin in "${ZSH_PLUGINS[@]}"
do
    if [[ ${plugin} =~ ^.*\/([a-zA-Z0-9_-]+)\.git$ ]]; then
        plugin_dir="${BASH_REMATCH[1]}"
        if [ -z "${plugin_dir}" ]; then
            echo "Matching ZSH plugin name from repo ${theme} produces empty result"
        elif [ -d "${ZSH_PLUGINS_DIR}/${plugin_dir}" ]; then
            echo "ZSH plugin ${plugin_dir} already exists"
        else
            echo "Clone ZSH plugin repo ${plugin} to ${ZSH_PLUGINS_DIR}"
            git -q clone "${plugin}" "${ZSH_PLUGINS_DIR}/${plugin_dir}"
        fi
    else
        echo "Could not match ZSH plugins name from repo ${plugin}"
    fi
done

if [ -f "${HOME}/.gitconfig" ]; then
    echo "Git config file already exists"
else
    echo "Copying Git config file to ${HOME}/.gitconfig"
    cp ${SCRIPT_DIR}/../git/gitconfig ${HOME}/.gitconfig
fi

if [ -f "${HOME}/.gitignore_global" ]; then
    echo "Git global ignore file already exists"
else
    echo "Copying Git global ignore file to ${HOME}/.gitignore_global"
    cp ${SCRIPT_DIR}/../git/gitignore_global ${HOME}/.gitignore_global
fi

if [ -f "${HOME}/.zshrc" ]; then
    if grep -q "PATH=\${PATH}:${BIN_DIR}" "${HOME}/.zshrc"; then
        echo "ZSH config file already contains devtool bin path"
    else
        echo "Adding devtool bin path to ZSH config file"
        echo "PATH=\${PATH}:${BIN_DIR}" >> ${HOME}/.zshrc
    fi
else
    echo "ZSH config file not found"
fi
