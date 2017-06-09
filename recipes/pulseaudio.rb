[
    "pulseaudio",
    {
        "arch" => "pulseaudio-alsa",
        "ubuntu" => [],
    },
    "pavucontrol",
].each do |to_install|
    multipack to_install
end
