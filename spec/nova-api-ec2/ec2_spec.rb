require 'spec_helper'

describe service('nova-api-ec2') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(8773) do
  it { should be_listening }
end
