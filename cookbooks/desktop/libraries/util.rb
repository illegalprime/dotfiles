def directories(from, to, &props)
    diff = to.gsub(Regexp::new("^#{from}"), "")
    diff = diff.split(File::SEPARATOR).keep_if { |c| c.length != 0 }
    diff.each_index do |i|
        directory File.join(from, diff[0..i]), &Proc.new
    end
end
