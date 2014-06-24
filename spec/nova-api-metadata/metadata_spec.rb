require 'spec_helper'

describe service('nova-api-metadata') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(8775) do
  it { should be_listening }
end
