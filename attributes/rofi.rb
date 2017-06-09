default[:rofi][:git] = 'https://github.com/DaveDavenport/rofi.git'
default[:rofi][:src] = File.join node[:personal_bin], 'rofi'
default[:rofi][:bin] = '/usr/local/bin/rofi'
default[:rofi][:font_size] = 13
default[:rofi][:font_family] = node[:font][:mono]

normal[:rofi][:xresources] = {
    'font' => "#{node[:rofi][:font_family]} #{node[:rofi][:font_size]}",
    'fuzzy' => true,
    'separator-style' => 'none',
    'padding' => 1,
    'lines' => 10,
    'borderwidth' => 2,
    'opacity' => 100,
    'hide-scrollbar' => true,
    # 'color-normal' => '#212121,#eeeeee,#313131,#eeeeee,#212121',
    'color-enabled' => true,
    'color-normal' => '#212121,#eeeeee,#212121,#313131,#eeeeee',
    'color-urgent' => '#fdf6e3,#dc322f,#eee8d5,#dc322f,#fdf6e3',
    'color-active' => '#fdf6e3,#268bd2,#eee8d5,#268bd2,#fdf6e3',
    'color-window' => '#212121,#313131',
}
