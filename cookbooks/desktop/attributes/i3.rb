# i3 Config Directory
default[:i3][:config_dir] = File.join node[:home], ".i3"
default[:i3][:config_path] = File.join node[:i3][:config_dir], "config"

# i3-status Config Directory
default[:i3][:status_config_path] = File.join default[:home], ".i3status.conf"

default[:i3][:super] = "Mod4"
default[:i3][:alt] = "Mod1"

###################################
# Configure the i3 Window Manager #
###################################
Super = node[:i3][:super]
Alt = node[:i3][:alt]

# i3 Settings
normal[:i3][:fonts] = [
    "pango:FontAwesome",
    "Oxygen Mono Regular 11",
]

# Startup applications
normal[:i3][:startup] = node[:startup] + [
    "redshift-gtk || redshift-gtk",
    "nitrogen --restore",
    "xmodmap -e 'clear Lock'",
    "xcape -e 'Control_L=Escape;Caps_Lock=Escape'",
    "xset -dpms",
    "xset s off",
    "rofi -key-run SuperL-d -key-window SuperL-grave -key-ssh Alt-s &",
]

# Ubuntu-specifics
if node[:platform] == "ubuntu"
    normal[:i3][:startup] += [
        "unity-settings-daemon &",
    ]
end

# Keyboard shortcuts for apps
normal[:i3][:apps] = [
    {
        :cmd => "urxvt -e zsh",
        :sym => [Super, "Return"],
    },
    {
        :cmd => node[:ipc][:lock],
        :sym => [Alt, "Shift", "l"],
    },
    {
        :cmd => node[:browser],
        :sym => [Alt, "w"],
    },
    {
        :cmd => node[:private_browser],
        :sym => [Alt, "Shift", "w"],
    },
    {
        :cmd => node[:file_explorer],
        :sym => [Alt, "f"],
    },
    {
        :cmd => "xcalib -invert -alter",
        :sym => [Super, "i"],
    },
    {
        :cmd => "#{node[:pleb_ui]} brightness up 4",
        :sym => ["XF86MonBrightnessUp"],
    },
    {
        :cmd => "#{node[:pleb_ui]} brightness down 4",
        :sym => ["XF86MonBrightnessDown"],
    },
    {
        :cmd => "#{node[:pleb_ui]} brightness set 1",
        :sym => ["Control", "XF86MonBrightnessDown"],
    },
    {
        :cmd => "#{node[:pleb_ui]} brightness set 100",
        :sym => ["Control", "XF86MonBrightnessUp"],
    },
    {
        :cmd => "#{node[:pleb_ui]} volume up 5",
        :sym => ["XF86AudioRaiseVolume"],
    },
    {
        :cmd => "#{node[:pleb_ui]} volume down 5",
        :sym => ["XF86AudioLowerVolume"],
    },
    {
        :cmd => "#{node[:pleb_ui]} volume toggle-mute",
        :sym => ["XF86AudioMute"],
    },
    {
        :cmd => "scrot",
        :sym => ["Print"],
    },
    {
        :cmd => "i3-dmenu-desktop --dmenu='rofi -dmenu'",
        :sym => ["Control", "Return"],
    },
]

# Hold this and drag to move floating windows
normal[:i3][:floating_modifier] = Super

# Close a window
normal[:i3][:close_window] = [Super, "Shift", "q"]

# Change focus between workspaces
normal[:i3][:focus] = {
    :left   => [Super, "h"],
    :right  => [Super, "l"],
    :up     => [Super, "k"],
    :down   => [Super, "j"],
    :toggle => [Super, "space"],
    :parent => [Super, "a"],
    :child  => [Super, "x"],
}

# Move windows around a workspace
normal[:i3][:move] = {
    :left  => [Super, "Shift", "h"],
    :right => [Super, "Shift", "l"],
    :up    => [Super, "Shift", "k"],
    :down  => [Super, "Shift", "j"],
}

# Open new window in vertical vs. horizontal mode
normal[:i3][:split] = {
    :horizontal => [Super, "b"],
    :vertical   => [Super, "v"],
    :toggle     => [Super, "e"],
}

# Enter fullscreen mode
normal[:i3][:fullscreen] = [Super, "f"]

# change container layout (stacked, tabbed, toggle split, floating)
normal[:i3][:stacking] = [Super, "s"]
normal[:i3][:tabbed]   = [Super, "w"]
normal[:i3][:floating] = [Super, "Shift", "space"]

normal[:i3][:workspace] = {
    :syms   => [1, 2, 3, 4, 5, 6, 7, 8, 9, 0],
    :goto   => [Super],
    :moveto => [Super, "Shift"],
}

normal[:i3][:restart] = [Super, "Shift", "r"]
normal[:i3][:reload]  = [Super, "Shift", "c"]

normal[:i3][:resize]  = [Super, "r"]
normal[:i3][:default] = ["Escape"]

normal[:i3][:resize] = {
    :mode => [Super, "r"],
    :amount => 5,
    :shrink => {
        :width => "h",
        :height => "k",
    },
    :grow => {
        :width => "l",
        :height => "j",
    },
}

normal[:i3][:hide_decorations] = true

normal[:i3][:gaps] = {
    :inner => 5,
}

normal[:i3][:bar] = {
    :status => "i3status",
    :command => "i3bar -t",
    :separator => "  ※  ",
    :colors => {
        :background => "#00000000",
        :statusline => "#e2e5de",
        :separator => "#bbc2c0",
        :workspace => {
            :focused => {
                :border      => "#00000000",
                :background  => "#00000000",
                :text        => "#ffffff",
            },
            :inactive => {
                :border      => "#00000000",
                :background  => "#00000000",
                :text        => "#999999",
            },
        },
    },
}

normal[:i3][:client] = {
    :focused => {
        :border     => "#aaaaaa",
        :background => "#aaaaaa",
        :text       => "#151718",
        :indicator  => "#9fca56",
    },
    :focused_inactive => {
        :border     => "#9fca56",
        :background => "#9fca56",
        :text       => "#151718",
        :indicator  => "#a074c4",
    },
    :unfocused => {
        :border     => "#1f2326",
        :background => "#1f2326",
        :text       => "#aaaaaa",
        :indicator  => "#a074c4",
    },
    :urgent => {
        :border     => "#ce4045",
        :background => "#ce4045",
        :text       => "#ffffff",
        :indicator  => "#dccd69",
    },
}

###############################
# Configure the i3 Status app #
###############################
normal[:i3][:status] = {
    :colors => true,
    :interval => 5,
    :order => [
        "load",
        "disk /",
        "wireless #{node[:wifi]}",
        "volume master",
        "battery 0",
        "tztime local",
    ],
    :indicators => {
        "wireless #{node[:wifi]}" => {
            "format_up" => "(%quality @ %essid) %ip icons:rss",
            "format_down" => "down icons:rss",
        },
        "battery 0" => {
            "format" => "%status %percentage %remaining icons:lightning",
        },
        "run_watch DHCP" => {
            "pidfile" => "/var/run/dhclient*.pid",
        },
        "run_watch VPN" => {
            "pidfile" => "/var/run/vpnc/pid",
        },
        "tztime local" => {
            "format" => "%Y-%m-%d %H:%M:%S",
        },
        "load" => {
            "format" => "%1min icons:gears",
        },
        "disk /" => {
            "format" => "%avail icons:download",
            "prefix_type" => "decimal icons:download",
        },
        "volume master" => {
            "format" => "%volume icons:speaker",
            "format_muted" => "%volume icons:muted",
            "device" => "default",
            "mixer" => "Master",
            "mixer_idx" => "0",
        },
    },
}

# TODO:
# Note `/etc/default/keyboard` is remapping caps lock to ctrl by adding
# the `XKBOPTIONS="ctrl:nocaps"` line.
