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

#######################################
# Setup perl Ctrl-Shift-V for pasting #
#######################################
multipack "xclip"

cookbook_file node[:urxvt][:perl_clipboard] do
    source "urxvt/perl-ext/clipboard.pl"
end
