file File.join node[:home], ".Xresources" do
    user node[:user]
    group node[:user]
    mode 0644
    content lazy {
        Dir[File.join node[:xresources_dir], "*"]
        .map do |xresources|
            "#include \"#{xresources}\""
        end
        .unshift("! Xresources managed by Chef for #{node[:fqdn]}")
        .join("\n") + "\n"
    }
end
