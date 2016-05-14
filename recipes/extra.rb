# Add extra scripts into the bin folder
[
    "bin/name",
].each do |extra|
    name = extra.split(File::SEPARATOR)[-1]
    cookbook_file File.join node[:personal_bin], name do
        owner node[:user]
        group node[:user]
        source extra
        mode 0775
    end
end
