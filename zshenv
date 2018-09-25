#
# ~/.zshenv
#

# utilities

export EDITOR='subl'

# local tools

# Path to your oh-my-zsh installation.
export ZSH=/Users/jose_rodriguez/.oh-my-zsh

# tools

export PATH=$PATH:$HOME/bin

# android
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_NDK=~/Library/Android/sdk/ndk-bundle
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_NDK:$JAVA_HOME/bin:$PATH"

