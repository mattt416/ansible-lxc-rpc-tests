require 'spec_helper'

describe service('nova-conductor') do
  it { should be_enabled   }
  it { should be_running   }
end

describe process("nova-conductor") do
  it { should be_running }
end
