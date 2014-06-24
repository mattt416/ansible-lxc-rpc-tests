require 'spec_helper'

os_packages = %w( libmariadbclient-dev mariadb-client curl wget iptables python-dev
                  sshpass git-core sqlite3 build-essential libssl-dev libffi-dev
                  libxml2-dev libxslt1-dev libpq-dev )

pip_packages = %w( pywbem MySQL-python python-cinderclient
                   python-keystoneclient cinder )

directories = %w( /var/log/cinder /var/lib/cinder /etc/cinder
                  /etc/cinder/rootwrap.d /var/cache/cinder /var/lock/cinder
                  /var/run/cinder )

conf_files = %w( cinder.conf api-paste.ini policy.json rootwrap.conf
                 rootwrap.d/volume.filters )

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
    it { should be_owned_by 'cinder' }
    it { should be_grouped_into 'cinder' }
  end
end

conf_files.each do |f|
  describe file("/etc/cinder/#{f}") do
    it { should be_file }
      it { should be_owned_by 'cinder' }
      it { should be_grouped_into 'cinder' }
  end
end

describe user('cinder') do
  it { should exist }
end

describe group('cinder') do
  it { should exist }
end
