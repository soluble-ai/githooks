#!/bin/bash

# Note: this script is explicitly NOT bundled into the githooks

# Install the "soluble" command if not already installed.
_install_soluble_if_not_present=true
(
  if ! [[ -x "$(command -v soluble)" ]]; then
    if [[${_install_soluble_if_not_present} == true ]]; then
      echo "installing soluble..."
      case ${OSTYPE} in
        darwin*)
          if [[ -x "$(command -v brew)" ]]; then
            echo "brew found. Using brew..."
            brew update
            brew install soluble-ai/soluble/soluble-cli
          fi
          ;;
        *)
          if [[ -x "$(command -v curl)" ]]; then
            curl https://raw.githubusercontent.com/soluble-ai/soluble-cli/master/linux-install.sh | sh
          elif [[ -x "$(command -v wget)" ]]; then
            wget -O - https://raw.githubusercontent.com/soluble-ai/soluble-cli/master/linux-install.sh | sh
          else
            echo "neither curl nor wget are installed. Unable to download soluble. Aborting."
            exit 1
          fi
          ;;
      esac
      if ! [[ -x "$(command -v soluble)" ]]; then
        echo "failed to install soluble. Aborting."
        exit 1
      fi
      echo "installed soluble"
    fi
    echo "soluble commad not present, and automatic installation not enabled. Aborting."
    echo "Please install soluble"
    exit 1
  fi
) >&2
