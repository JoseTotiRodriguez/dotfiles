#
# ~/.zshenv
#

# utilities

export EDITOR='subl'
export TERM=xterm-256color

# local tools

# Path to your oh-my-zsh installation.
export ZSH=/Users/jose_rodriguez/.oh-my-zsh

# tools

export PATH=$PATH:$HOME/bin

# android
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_NDK=~/Library/Android/sdk/ndk-bundle
export AIRBNB_ANDROID_HOME=~/Documents/apps/android
export AIRBNB_LONA_SPEC_HOME=~/Documents/lona-spec
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_NDK:$JAVA_HOME/bin:$PATH"

