require_relative '../spec_helper'

%w(openvpn udev iptables).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe package('awscli') do
  it { should be_installed.by('pip') }
end

describe command('sudo apt-get upgrade') do
  its(:stdout) { should match /0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded/ }
end
