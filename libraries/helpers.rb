module CustomWebCookbook
  module Helpers
    def package_name
      case node['platform']
      when 'centos' then 'httpd'
      when 'ubuntu' then 'apache2'
      end
    end

    def service_name
      case node['platform']
      when 'centos' then 'httpd'
      when 'ubuntu' then 'apache2'
      end
    end
  end
end
