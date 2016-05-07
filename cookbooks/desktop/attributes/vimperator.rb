default[:vimperator][:rc] = File.join node[:home], ".vimperatorrc"
default[:vimperator][:config] = File.join node[:home], ".vimperator"
default[:vimperator][:plugin] = File.join node[:vimperator][:config], "plugin"

normal[:vimperator][:settings] = {
    "defsearch" => "google",
    "suggestengines" => "google",
    "gui" => "none,tabs,addons",
    "hintchars" => "hjklasdfgyuiopqwertnmzxcvb",
}

normal[:vimperator][:firefox_settings] = {
    "browser.fullscreen.animateUp" => 0,
    "layout.spellcheckDefault" => 2,
    "browser.tabs.closeButtons" => 2,
}

normal[:vimperator][:noremap] = {
    "<C-h>" => "gT",
    "<C-l>" => "gt",
    "<C-p>" => ":tabmove! -1<CR>",
    "<C-n>" => ":tabmove! +1<CR>",
}

normal[:vimperator][:inoremap] = {
    "<C-h>" => "<BS>",
}

normal[:vimperator][:map] = {
    ";" => ":",
    "=" => "zi",
    "-" => "zo",
}

normal[:vimperator][:style][:Hint] = {
    "font-size" => "14px",
    "border-radius" => "2px",
    "padding-left" => "3px",
    "padding-right" => "4px",
    "background-color" => "#5294e2",
}

normal[:vimperator][:autohide] = true
normal[:vimperator][:hide_separator] = true

normal[:vimperator][:globals] = {
    "smooziee_scroll_amount" => 250,
}
