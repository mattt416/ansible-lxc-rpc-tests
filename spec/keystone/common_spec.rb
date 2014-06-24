require 'spec_helper'

os_packages = %w( python-dev mariadb-client libmariadbclient-dev libsasl2-dev
                  debhelper dh-apparmor sshpass git-core docutils-common
                  libjs-sphinxdoc libjs-underscore libxslt1.1 libxslt1-dev
                  libxml2-dev libssl-dev libldap2-dev libffi-dev )

pip_packages = %w( repoze.lru pbr MySQL-python python-keystoneclient keystone )

directories = %w( /etc/keystone /etc/keystone/ssl /var/lib/keystone
                  /var/log/keystone )

conf_files = %w( default_catalog.templates keystone-paste.ini keystone.conf
                 policy.json policy.v3cloudsample.json )

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
    it { should be_owned_by 'keystone' }
    it { should be_grouped_into 'keystone' }
  end
end

conf_files.each do |f|
  describe file("/etc/keystone/#{f}") do
    it { should be_file }
    it { should be_owned_by 'keystone' }
    it { should be_grouped_into 'keystone' }
  end
end

describe user('keystone') do
  it { should exist }
end

describe group('keystone') do
  it { should exist }
end

describe service('keystone') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(5000) do
  it { should be_listening }
end

describe port(35357) do
  it { should be_listening }
end
