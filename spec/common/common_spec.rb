require 'spec_helper'

packages = %w( python-software-properties python-dev build-essential git-core
               rsyslog lvm2 libssl-dev )

packages.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
