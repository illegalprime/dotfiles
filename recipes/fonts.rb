directory node[:fonts][:home] do
    owner node[:user]
    group node[:user]
    action :create
end

for font in node[:fonts][:files]
    cookbook_file File.join node[:fonts][:home], font do
        source File.join 'fonts', font
        owner node[:user]
        group node[:user]
        action :create
        notifies :run, 'bash[refresh-font-cache]', :delayed
    end
end

bash 'refresh-font-cache' do
    user 'root'
    group 'root'
    code 'fc-cache -f -v'
    action :nothing
end
