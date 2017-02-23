# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git adb droplr history-substring-search zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# aliases
alias ..="cd .."          # Go up one directory
alias ...="cd ../.."      # Go up two directories
alias ....="cd ../../.."  # Go up three directories
alias desk="cd ~/Desktop"
alias apps="cd ~/Documents/apps/"
alias droid="cd ~/Documents/apps/android"
alias droid-copy="cd ~/Documents/apps-copy/android"
alias ios="cd ~/Documents/apps/ios"
alias airrepo="cd ~/airlab"

export NVM_DIR="/Users/jose_rodriguez/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# Android
setupBuckDroid() {
	cd ~/Documents/apps/android
	./buckw project
}

runReactDroid() {
    cd ~/Documents/apps/react-native
    npm i && npm run dev
}

runBuckDroid() {
	cd ~/Documents/apps/android
	./buckw install -r -x airbnbDebug
}

runBuckDroidCopy() {
	cd ~/Documents/apps-copy/android
	./buckw install -r -x airbnbDebug
}

runBuckN2Playground() {
	cd ~/Documents/apps/android
	./buckw install -r -x n2playgroundDebug
}

runBuckN2PlaygroundCopy() {
	cd ~/Documents/apps-copy/android
	./buckw install -r -x n2playgroundDebug
}

# Ruby required for Android app
eval "$(rbenv init -)"
