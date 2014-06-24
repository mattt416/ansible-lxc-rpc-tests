require 'spec_helper'

describe service('glance-registry') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(9191) do
  it { should be_listening }
end
