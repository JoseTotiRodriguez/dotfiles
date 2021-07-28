#
# ~/.zshenv
#

# utilities

export EDITOR='nano'
export VISUAL='nano'
export TERM=xterm-256color

# local tools

# Path to your oh-my-zsh installation.
export ZSH=/Users/jose_rodriguez/.oh-my-zsh

# tools
export PATH=$PATH:$HOME/bin

# treehouse
export PATH=/Users/jose_rodriguez/airlab/repos/treehouse/projects/viaduct/services/viaduct/scripts:$PATH

# java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
# export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export PATH=$JAVA_HOME/bin:$PATH

# android
export ANDROID_HOME=~/Library/Android/sdk
export AIRBNB_ANDROID_HOME=~/Documents/apps/android
export ANDROID_NDK="$ANDROID_HOME/ndk/21.0.6113669"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/tools:$PATH"

