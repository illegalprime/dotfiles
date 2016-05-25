[
    "cups",
    "ghostscript",
    "gsfonts",
    {
        "ubuntu" => "system-config-printer-gnome",
        "arch" => "system-config-printer",
    },
]
.each do |to_install|
    multipack to_install
end

service 'org.cups.cupsd' do
    action :enable
end
