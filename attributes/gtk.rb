default[:gtk][:font] = {
    # the default main font
    :family => default[:font][:sans],
    :size => 11,
}

default[:gtk][:themes] = {
    :numix => {
        :window => "Numix",
        :icon => "Numix-Circle",
        :package => {
            "ubuntu" => [
                "numix-gtk-theme",
                "numix-icon-theme-circle",
            ],
            "arch" => [
                "numix-themes",
                "aur:numix-circle-icon-theme-git",
            ],
        },
    },
}

default[:gtk][:theme][:window] = node[:gtk][:themes][:numix]
default[:gtk][:theme][:icon] = node[:gtk][:themes][:numix]

default[:gtk2][:config][:system] = "/etc/gtk-2.0/gtkrc"
default[:gtk3][:config][:system] = "/etc/gtk-3.0/settings.ini"
default[:gtk3][:css][:user] = File.join node[:config], "gtk-3.0/gtk.css"

if node[:platform] == "ubuntu"
    # for the numix theme
    node[:ppas].push "ppa:numix/ppa"
end
