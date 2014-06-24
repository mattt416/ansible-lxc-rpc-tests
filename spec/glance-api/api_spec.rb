require 'spec_helper'

describe service('glance-api') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(9292) do
  it { should be_listening }
end
