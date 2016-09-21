package_name =
  service_name =
    case os[:family]
    when 'centos' then 'httpd'
    when 'ubuntu' then 'apache2'
    end

describe package package_name do
  it { should be_installed }
end

describe service service_name do
  it { should be_enabled }
  it { should be_running }
end

describe command 'curl localhost' do
  its('stdout') { should match(/hello/i) }
  its('exit_status') { should eq 0 }
end

describe port 80 do
  it { should be_listening }
end
