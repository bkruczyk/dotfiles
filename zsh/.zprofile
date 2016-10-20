if [ -d "$HOME/.zfunctions" ]; then
    fpath=( "$HOME/.zfunctions" $fpath )
fi

source $HOME/.env
source $HOME/.lesskey
source $HOME/.aliases
