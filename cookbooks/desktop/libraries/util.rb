def directories(from, to, &props)
    diff = to.gsub(Regexp::new("^#{from}"), "")
    diff = diff.split(File::SEPARATOR).keep_if { |c| c.length != 0 }
    diff.each_index do |i|
        directory File.join(from, diff[0..i]), &Proc.new
    end
end

def multipack pkg_name
    # Get the real name of the package
    names = if pkg_name.is_a? Hash
        pkg_name[node[:platform]]
    elsif pkg_name.is_a? String or pkg_name.is_a? Array
        pkg_name
    else
        raise ArgumentError, "Must pass in a string or a hash"
    end

    # We'll only iterate through one package in this case
    if names.is_a? String
        names = [names]
    end

    # Install it specially if it needs it
    for single_pkg in names
        if single_pkg.include? ":"
            type, name = single_pkg.split ":", 2
            case type
            when "recipe"
                include_recipe recipe
            when "aur"
                fail if node[:platform] != "arch"
                pacman_aur name
            when "group"
                fail if node[:platform] != "arch"
                pacman_group name
            end
        else
            if block_given?
                package single_pkg, &Proc.new
            else
                package single_pkg
            end
        end
    end
end
