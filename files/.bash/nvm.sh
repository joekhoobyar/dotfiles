export NVM_DIR="$HOME/.nvm"
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then . "/opt/homebrew/opt/nvm/nvm.sh"
elif [ -s "$NVM_DIR/nvm.sh" ]; then . "$NVM_DIR/nvm.sh"
fi
if [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ]; then . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
elif [ -s "$NVM_DIR/bash_completion" ]; then . "$NVM_DIR/bash_completion"
fi
