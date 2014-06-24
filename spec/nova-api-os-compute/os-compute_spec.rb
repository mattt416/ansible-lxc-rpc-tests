require 'spec_helper'

describe service('nova-api-os-compute') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(8774) do
  it { should be_listening }
end
