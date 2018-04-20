package_name =
    service_name =
        case os[:family]
        when 'redhat' then 'httpd'
        when 'debian' then 'apache2'
        end

describe package(package_name) do
  it { should_not be_installed }
end

describe service(service_name) do
  it { should_not be_enabled }
  it { should_not be_running }
end

describe command('curl localhost') do
  its('stdout') { should_not match(/hello/i) }
  its('exit_status') { should_not eq 0 }
end

describe port(80) do
  it { should_not be_listening }
end
