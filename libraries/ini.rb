
module Ini

    def self.change_settings! content, settings
        mi = Regexp::MULTILINE | Regexp::IGNORECASE
        settings.each do |section, assignments|
            # Make sure section exists
            header_re = Regexp.new "^\\s*\\[#{Regexp.escape section}\\]", mi
            section_re = Regexp.new "#{header_re.source}.*?(^\\[|\\Z)", mi
            sect_data = content.match section_re

            if !sect_data
                # shortcut if the section isn't there
                content += "\n[#{section}]\n" + assignments
                .each_pair.map do |setting, value|
                    "#{setting}=#{value}"
                end
                .join("\n") + "\n"

                next
            end

            sect_data = sect_data[0]
            missing = []

            assignments.each do |setting, value|
                set_esc = Regexp.escape setting
                setting_re = Regexp.new "(^\\s*#{set_esc}\\s*=\\s*)(\\S+)", mi

                if sect_data =~ setting_re
                    if $~[2] != value
                        sect_data.gsub! setting_re, "\\1#{value}"
                    end
                else
                    missing.push "#{setting}=#{value}"
                end
            end

            if missing.length > 0
                sect_data.gsub! header_re, "\\0\n#{missing.join "\n"}"
            end

            content.gsub! section_re, sect_data
        end
        content
    end

end
