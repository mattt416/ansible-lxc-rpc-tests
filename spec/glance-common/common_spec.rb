require 'spec_helper'

os_packages = %w( rsync libmariadbclient-dev mariadb-client curl wget iptables
                  python-dev sshpass git-core sqlite3 build-essential libssl-dev
                  libffi-dev )

pip_packages = %w( warlock MySQL-python python-glanceclient
                   python-keystoneclient glance )


directories = %w( /var/log/glance /var/lib/glance /var/lib/glance/cache
                  /var/lib/glance/cache/api /var/lib/glance/cache/registry
                  /var/lib/glance/scrubber /etc/glance /var/cache/glance )

conf_files = %w( glance-api.conf glance-cache.conf glance-registry-paste.ini
                 glance-registry.conf glance-scrubber.conf policy.json
                 schema-image.json )

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
    it { should be_owned_by 'glance' }
    it { should be_grouped_into 'glance' }
  end
end

conf_files.each do |f|
  describe file("/etc/glance/#{f}") do
    it { should be_file }
    it { should be_owned_by 'glance' }
    it { should be_grouped_into 'glance' }
  end
end

describe user('glance') do
  it { should exist }
end

describe group('glance') do
  it { should exist }
end
