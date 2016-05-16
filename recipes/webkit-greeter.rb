multipack node[:webkit_greeter][:package]

# update all the greeters
node[:webkit_greeter][:themes].values.each do |theme|
    git File.join node[:webkit_greeter][:themes_dir], theme[:name] do
        repository theme[:git]
    end
end

# change the webkit greeter theme to the current one
file node[:webkit_greeter][:config] do
    content lazy {
        Ini.change_settings!(File.open(node[:webkit_greeter][:config]).read, {
            "greeter" => {
                "webkit-theme" => node[:webkit_greeter][:theme][:name],
            },
        })
    }
end

# set the lightdm greeter to the webkit2 greeter
file node[:lightdm][:config] do
    content lazy {
        Ini.change_settings!(File.open(node[:lightdm][:config]).read, {
            "Seat:*" => {
                "greeter-session" => node[:webkit_greeter][:lightdm_name],
            },
        })
    }
end
