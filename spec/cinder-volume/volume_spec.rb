require 'spec_helper'

describe service('cinder-volume') do
  it { should be_enabled   }
  it { should be_running   }
end

describe process("cinder-volume") do
  it { should be_running }
end
