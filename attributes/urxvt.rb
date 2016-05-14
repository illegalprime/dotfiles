default[:urxvt][:font] = node[:font]
default[:urxvt][:font_family] = default[:urxvt][:font][:mono]
default[:urxvt][:font_size] = 16

if node[:urxvt][:font][:tag] == :oxygen
    # some special thing about urxvt?
    override[:urxvt][:font_family] = "Oxygen Mono"
end

normal[:urxvt][:xresources] = {
    "iso14755" => false,
    "scrollBar" => false,
    "font" => "xft:#{node[:urxvt][:font_family].delete " "}" \
              ":pixelsize=#{node[:urxvt][:font_size]}," \
              "xft:Monospace:size=9" \
              ":antialias=true:hinting=true",

    # TODO: Set this up fully
    "keysym.Shift-Control-V" => "perl:clipboard:paste",
    "perl-ext-common" => "default,clipboard",

    "depth" => 32,
    "background" => "[100]#2D2D2D",
    "foreground" => "#FFFFFF",
    "color0"  => "#2E3436",
    "color8"  => "#555753",
    "color1"  => "#CC0000",
    "color9"  => "#EF2929",
    "color2"  => "#4E9A06",
    "color10" => "#8AE234",
    "color3"  => "#C4A000",
    "color11" => "#FCE94F",
    "color4"  => "#3465A4",
    "color12" => "#729FCF",
    "color5"  => "#75507B",
    "color13" => "#AD7FA8",
    "color6"  => "#06989A",
    "color14" => "#34E2E2",
    "color7"  => "#D3D7CF",
    "color15" => "#EEEEEC",
}
