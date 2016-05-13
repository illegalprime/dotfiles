multipack "rxvt-unicode"

template File.join node[:xresources_dir], "urxvt.Xresources" do
    user node[:user]
    group node[:user]
    mode 0644
    source "xresources.erb"
    variables ({
        :application => "urxvt",
        :settings => node[:urxvt][:xresources],
    })
end

# TODO: Setup perl Ctrl-Shift-V for pasting
