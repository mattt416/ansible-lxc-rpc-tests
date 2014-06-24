require 'spec_helper'

describe service('cinder-api') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(8776) do
  it { should be_listening }
end
