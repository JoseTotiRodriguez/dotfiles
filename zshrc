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
alias rapps="cd ~/Documents/apps/"
alias rdroid="cd ~/Documents/apps/android"
alias rdroid-copy="cd ~/Documents/apps-copy/android"
alias rios="cd ~/Documents/apps/ios"
alias rlab="cd ~/airlab"
alias rairbnb="cd ~/airlab/repos/airbnb"
alias stetho="osascript ~/dotfiles/scripts/stetho.applescript"

export NVM_DIR="/Users/jose_rodriguez/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# Android

erf() {
    adb shell am start -a android.intent.action.EDIT -d "airbnb://erf" -e experiment_name "$1" -e treatment_name "${2:-enabled}"
}

deeplink () {
    adb shell am start -a android.intent.action.VIEW -d "$1"
}

input() {
    adb shell input text "$1"
}

function androidVideo() {
    trap "pullrecord" INT
    adb shell screenrecord --size 1280x720 /mnt/sdcard/recording.mp4
}


function pullrecord() {
    adb pull /mnt/sdcard/recording.mp4 ~/Desktop/
    adb shell rm "mnt/sdcard/recording.mp4"
}

androidScreenshot() {
  echo "Taking screenshot..."
  current_time=$(date +"%Y-%m-%d-%S")
  adb shell screencap -p "/mnt/sdcard/$current_time.png"
  adb pull /mnt/sdcard/$current_time.png ~/Desktop/$current_time.png
  adb shell rm "/mnt/sdcard/$current_time.png"
}

fixAdb() {
  adb kill-server
  adb devices
}

# Apps Build

bs() {
	cd ~/Documents/apps/android
	echo "./buckw project"
	./buckw project
  ba # build onto device
}

reactDroid() {
    cd ~/Documents/apps/react-native
    npm i && npm run dev
}

ba() {
	cd ~/Documents/apps/android
	echo "./buckw install -r -x airbnbFullDebug"
	./buckw install -r -x airbnbFullDebug
  buildFinished # notify
}

bac() {
	cd ~/Documents/apps-copy/android
	echo "./buckw install -r -x airbnbFullDebug"
	./buckw install -r -x airbnbFullDebug
  buildFinished # notify
}

bp() {
	cd ~/Documents/apps/android
	echo "./buckw install -r -x n2playgroundDebug"
	./buckw install -r -x n2playgroundDebug
  buildFinished # notify
}

bpc() {
	echo "./buckw install -r -x n2playgroundDebug"
	cd ~/Documents/apps-copy/android
	./buckw install -r -x n2playgroundDebug
  buildFinished # notify
}

buildFinished() {
  osascript -e 'display notification with title "Buck Build Finished"'
}

# Helpful shortcuts

pr() {
	open https://git.musta.ch/airbnb/apps/pull/$1
}

bug() {
	open https://jira.airbnb.biz/browse/$1
}


# Ruby required for Android app
eval "$(rbenv init -)"

# AIRLAB-DO-NOT-MODIFY section:ShellWrapper {{{
# Airlab will only make edits inside these delimiters.

# Source Airlab's shell integration, if it exists.
if [ -e ~/.airlab/shellhelper.sh ]; then
  source ~/.airlab/shellhelper.sh
fi
# AIRLAB-DO-NOT-MODIFY section:ShellWrapper }}}
