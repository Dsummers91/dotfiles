[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

