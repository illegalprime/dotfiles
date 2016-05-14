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
