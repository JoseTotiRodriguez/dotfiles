#!/usr/bin/env osascript
tell application "Google Chrome"
  make new window
  activate
  open location "chrome://inspect#devices"
  delay .5
  set inspectTab to front window's active tab
      execute inspectTab javascript "document.querySelector('.properties-box .action').click();"
  close inspectTab
end tell
