require 'spec_helper'

describe service('cinder-scheduler') do
  it { should be_enabled   }
  it { should be_running   }
end

describe process("cinder-scheduler") do
  it { should be_running }
end
