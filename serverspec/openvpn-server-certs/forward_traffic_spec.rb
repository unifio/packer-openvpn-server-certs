require_relative '../spec_helper'

describe command('sudo sysctl net.ipv4.ip_forward') do
  its(:stdout) { should match /net.ipv4.ip_forward = 1/ }
end

describe service('iptables') do
  it { should be_enabled }
end

describe iptables do
  it { should have_rule('-A POSTROUTING -o eth0 -j MASQUERADE').with_table('nat') }
  it { should have_rule('-A FORWARD -i eth0 -o tun0 -m state --state RELATED,ESTABLISHED -j ACCEPT') }
  it { should have_rule('-A FORWARD -i tun0 -o eth0 -j ACCEPT') }
end
