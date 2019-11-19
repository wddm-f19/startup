#!/bin/sh

# TO RUN THIS SCRIPT
# From the command line:
#   sh startup.sh


# INSTALL IBM PLEX FONT
# https://www.ibm.com/plex/
curl -L https://github.com/IBM/plex/releases/download/v3.0.0/OpenType.zip -o ~/Downloads/OpenType.zip
unzip ~/Downloads/OpenType.zip -d ~/Downloads/
cp -a ~/Downloads/OpenType/IBM-Plex-Mono/. ~/Library/Fonts
rm -R ~/Downloads/OpenType ~/Downloads/OpenType.zip


# SETUP VSCODE "CODE" COMMAND
cat << EOF >> ~/.bash_profile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF


# INSTALL EXTENSIONS
# ~/.vscode/extensions
# https://code.visualstudio.com/docs/editor/command-line
# https://code.visualstudio.com/docs/editor/extension-gallery
# code --install-extension ritwickdey.liveserver --force
extensions=(
  ritwickdey.liveserver
  pkief.material-icon-theme
  equinusocio.vsc-material-theme
  coenraads.bracket-pair-colorizer
  aaron-bond.better-comments
  wmaurer.change-case
  streetsidesoftware.code-spell-checker
  vincaslt.highlight-matching-tag
  solnurkarim.html-to-css-autocompletion
  kisstkondoros.vscode-gutter-preview
  compulim.vscode-ipaddress
  yzhang.markdown-all-in-one
  shd101wyy.markdown-preview-enhanced
)
for ext in "${extensions[@]}"
do
  code --install-extension $ext --force
done


# **** SETTINGS FILE
# https://code.visualstudio.com/docs/getstarted/settings#_default-settings
# cat > ~/Library/Application\ Support/Code/User/settings.json
cat > ~/Library/Application\ Support/Code/User/settings.json << EOF
{
  "window.zoomLevel": 0,
  "editor.fontSize": 18,
  "editor.tabSize": 2,
  "editor.minimap.enabled": false,
  "editor.selectionHighlight": false,
  "editor.matchBrackets": false,
  "editor.fontFamily": "'IBM Plex Mono', Menlo, Monaco, 'Courier New', monospace"
  "editor.copyWithSyntaxHighlighting": false,
  "workbench.colorTheme": "Material Theme Darker High Contrast",
  "workbench.colorCustomizations": {
    "activityBar.activeBorder": "#ff6d7e",
    "activityBar.activeBackground": "#ff6d7e20"
  },
  "liveServer.settings.donotShowInfoMsg": true
}
EOF


# **** OPEN CHROME WITH TABS
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome https://wddm-f19.slack.com/ http://learn.humber.ca


# **** MACOS SETTINGS
# defaults write -g com.apple.mouse.scaling 5.0
# defaults write -g com.apple.trackpad.scaling 5.0
# More to come, a few examples of all of the available settings
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh


# **** CLONE AND OPEN REPO
git clone https://github.com/wddm-f19/fall-2019 ~/Desktop/fall-2019
code ~/Desktop/fall-2019


# LET'S GO!
echo "**********************************************";
echo "*** REMEMBER TO RELOAD OPEN VSCODE WINDOWS ***";
echo "***     (CMD+SHIFT+P >> RELOAD WINDOW)     ***";
echo "**********************************************";