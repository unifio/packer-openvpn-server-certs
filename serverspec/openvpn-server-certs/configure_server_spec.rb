require_relative '../spec_helper'

describe service('get-openvpn-certs') do
  it { should_not be_enabled }
end

describe service('openvpn@server') do
  it { should be_enabled }
end
