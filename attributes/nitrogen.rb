default[:nitrogen][:config] = File.join node[:config], "nitrogen"
default[:nitrogen][:background] = {
    :path => File.join(node[:config], "background"),
    :mode => 5,
    :color => "#000000",
}

normal[:nitrogen][:current] = "backgrounds/Forever_by_Shady_S.jpg"
