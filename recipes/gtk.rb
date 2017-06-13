# install all needed themes
[
    node[:gtk][:theme][:window][:package],
    node[:gtk][:theme][:icon][:package],
].each do |theme|
    multipack theme
end

# configure gtk2 theme
template node[:gtk2][:config][:system] do
    source "gtk/two.erb"
end

# configure gtk3 theme
template node[:gtk3][:config][:system] do
    source "gtk/three.erb"
end

# add gtk3 css config
cookbook_file node[:gtk3][:css][:user] do
    source "gtk/three.css"
    owner node[:user]
    group node[:user]
end

############################
# Platform specific things #
############################
case node[:platform]
when 'ubuntu'
  bash 'set the numix gtk theme with gsettings' do
    code 'gsettings set org.gnome.desktop.interface gtk-theme Numix'
    not_if 'gsettings get org.gnome.desktop.interface gtk-theme | grep Numix'
    user node[:user]
    group node[:user]
    environment 'HOME' => node[:home]
    action :run
  end

  bash 'set the numix gtk icon theme with gsettings' do
    code 'gsettings set org.gnome.desktop.interface icon-theme Numix-Circle'
    not_if 'gsettings get org.gnome.desktop.interface icon-theme | grep Numix-Circle'
    user node[:user]
    group node[:user]
    environment 'HOME' => node[:home]
    action :run
  end

when 'arch'
end


