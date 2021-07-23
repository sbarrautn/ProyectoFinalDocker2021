#!/usr/bin/env bash
#help: Install bash completions for pfd

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASH_COMPLETION_FILE=~/.bash_completion

if  [ -f $BASH_COMPLETION_FILE ] && grep -q  "PROYECTO_FINAL_COMPLETIONS_INSTALLED" $BASH_COMPLETION_FILE; then
    echo
    echo "Proyecto final bash completions already installed"
    echo
    exit 0;
fi
cat $SCRIPT_DIR/proyecto-completions >> $BASH_COMPLETION_FILE
chmod +x $BASH_COMPLETION_FILE
source $BASH_COMPLETION_FILE
echo
echo "Proyecto final bash completions installed."
echo
