include CustomWebCookbook::Helpers

property :homepage, String, default: '<h1>Hello world!</h1>'

default_action :create

load_current_value do
  if ::File.exist?('/var/www/html/index.html')
    homepage IO.read('/var/www/html/index.html')
  end
end

action :create do
  package package_name

  service service_name do
    action [:enable, :start]
  end

  file '/var/www/html/index.html' do
    content current_resource.homepage
  end
end

action :delete do
  service package_name do
    action [:stop, :disable]
  end

  package package_name do
    action :remove
  end
end
