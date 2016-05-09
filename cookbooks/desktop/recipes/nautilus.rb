multipack "nautilus"

# Provide 'file_explorer'
node.normal[:file_explorer] = "nautilus --no-desktop"

# Make sure a random background doesn't show up when opening
node[:startup].push(
    "gsettings set org.gnome.desktop.background show-desktop-icons false"
)
