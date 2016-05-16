version = case node[:platform]
when "ubuntu"
    "webkit"
when "arch"
    "webkit2"
end

theme = :hackerz

default[:webkit_greeter][:version] = version
default[:webkit_greeter][:lightdm_name] = "lightdm-#{version}-greeter"
default[:webkit_greeter][:themes_dir] = "/usr/share/lightdm-webkit/themes"
default[:webkit_greeter][:config] = "/etc/lightdm/lightdm-#{version}-greeter.conf"
default[:webkit_greeter][:package] = {
    "ubuntu" => "lightdm-#{version}-greeter",
    "arch" => "aur:lightdm-#{version}-greeter",
}

default[:webkit_greeter][:themes] = {
    :hackerz => {
        :name => "hackerz",
        :git => "https://github.com/illegalprime/hackerz.git"
    },
}

normal[:webkit_greeter][:theme] = default[:webkit_greeter][:themes][theme]
