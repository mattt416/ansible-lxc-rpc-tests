require 'spec_helper'

os_packages = %w( libmariadbclient-dev mariadb-client curl wget iptables python-dev
                  sshpass git-core sqlite3 build-essential libssl-dev libffi-dev
                  libxml2-dev libxslt1-dev libpq-dev )

pip_packages = %w( MySQL-python python-keystoneclient python-novaclient nova )

directories = %w( /var/log/nova /var/lib/nova /var/lib/nova/cache/api /etc/nova
                  /etc/nova/rootwrap.d /var/cache/nova /var/lock/nova
                  /var/run/nova )

os_packages.each do |os|
  describe package(os) do
    it { should be_installed }
  end
end

pip_packages.each do |pip|
  describe package(pip) do
    it { should be_installed.by('pip') }
  end
end

directories.each do |d|
  describe file(d) do
    it { should be_directory }
    it { should be_owned_by 'nova' }
    it { should be_grouped_into 'nova' }
  end
end

describe file('/etc/nova/nova.conf') do
  it { should be_file }
    it { should be_owned_by 'nova' }
    it { should be_grouped_into 'nova' }
end

describe user('nova') do
  it { should exist }
end

describe group('nova') do
  it { should exist }
end
