require 'spec_helper'

describe service('nova-scheduler') do
  it { should be_enabled   }
  it { should be_running   }
end

describe process("nova-scheduler") do
  it { should be_running }
end
