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
plugins=(
    git
    adb
    zsh-syntax-highlighting
    zsh-autosuggestions
    fzf
    tmux
)
# This depends on the following being installed:
# brew install tmux
# brew install fzf
# Manual install of https://github.com/gpakosz/.tmux
# brew install reattach-to-user-namespace for copy-pasting from tmux
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


source $ZSH/oh-my-zsh.sh

# yak autocomplete
autoload -U compinit; compinit

# kubectl autocomplete (also with k alias)
source <(kubectl completion zsh)
complete -F __start_kubectl k

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# aliases
alias ..="cd .."          # Go up one directory
alias ...="cd ../.."      # Go up two directories
alias ....="cd ../../.."  # Go up three directories
alias desk="cd ~/Desktop"
alias rapps="cd ~/Documents/apps/"
alias rdroid="cd ~/Documents/apps/android"
alias rios="cd ~/Documents/apps/ios"
alias rlab="cd ~/airlab"
alias rbnb="cd ~/airlab/repos/airbnb"
alias rth="cd ~/airlab/repos/treehouse"
alias stetho="osascript ~/dotfiles/scripts/stetho.applescript"
alias glt="git pull --tags"


export NVM_DIR="/Users/jose_rodriguez/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# yak

ylisten() {
    echo "Running kubectl --context airdev-a --namespace airbob-staging port-forward $(kubectl get pod --context=airdev-a -o=name -n airbob-staging | grep jose-rodriguez) 5005"
    kubectl --context airdev-a --namespace airbob-staging port-forward $(kubectl get pod --context=airdev-a -o=name -n airbob-staging | grep jose-rodriguez) 5005
}

ybBDeploy() {
    echo "Running yak deploy -b bazel"
    yak deploy -b bazel
}

ybReload() {
    echo "Running yak reload $1 -b bazel"
    yak reload $1 -b bazel
}

yr() {
    echo "Running yak remote -- $1"
    yak remote -- $1
}

ytestDebug() {
    echo "Running yak remote -- ./gradlew :projects:viaduct:$1:test  --debug-jvm"
    yak remote -- ./gradlew :projects:viaduct:$1:test  --debug-jvm
}

ytest() {
    echo "Running yak remote -- ./gradlew :projects:viaduct:$1:test"
    yak remote -- ./gradlew :projects:viaduct:$1:test
}

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
    echo "./gero bp"
    ./gero bp
    ba # build onto device
}

b() {
    cd ~/Documents/apps/android
    echo "./gero install -r -x airbnb$1Debug"
    ./gero install -r -x airbnb$1Debug
    buildFinished # notify
}

ba() {
    cd ~/Documents/apps/android
    echo "./gero install -r -x airbnbFullDebug"
    ./gero install -r -x airbnbFullDebug
    buildFinished # notify
}

bp() {
    cd ~/Documents/apps/android
    echo "./gero install -r -x planetariumDebug"
    ./gero install -r -x planetariumDebug
    buildFinished # notify
}

buildFinished() {
    osascript -e 'display notification with title "Buck Build Finished"'
}


# Helpful shortcuts

pra() {
    open https://git.musta.ch/airbnb/apps/pull/$1
}

prt() {
	open https://git.musta.ch/airbnb/treehouse/pull/$1
}

prt-commit() {
    open https://git.musta.ch/airbnb/treehouse/pulls?q=is%3Apr++$1
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
eval "$(pyenv init -)"

