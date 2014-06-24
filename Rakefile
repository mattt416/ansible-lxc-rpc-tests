require 'rake'
require 'rspec/core/rake_task'

hosts = [
  {
    :name  => '192.168.18.200',
    :roles => %w( common keystone ),
  },
  {
    :name  => '192.168.18.201',
    :roles => %w( common glance-common glance-api glance-registry),
  },
  {
    :name  => '192.168.18.207',
    :roles => %w( common nova-common nova-api-os-compute ),
  },
  {
    :name  => '192.168.18.206',
    :roles => %w( common nova-common nova-api-ec2 ),
  },
  {
    :name  => '192.168.18.208',
    :roles => %w( common nova-common nova-api-metadata ),
  },
  {
    :name  => '192.168.18.213',
    :roles => %w( common nova-common nova-conductor ),
  },
  {
    :name  => '192.168.18.209',
    :roles => %w( common nova-common nova-scheduler ),
  },
  {
    :name  => '192.168.18.203',
    :roles => %w( common cinder-common cinder-api ),
  },
  {
    :name  => '192.168.18.244',
    :roles => %w( common cinder-common cinder-scheduler ),
  },
  {
    :name  => '192.168.18.245',
    :roles => %w( common cinder-common cinder-volume ),
  },
]

desc "Run serverspec to all hosts"
task :spec => 'serverspec:all'

class ServerspecTask < RSpec::Core::RakeTask

  attr_accessor :target

  def spec_command
    cmd = super
    "env TARGET_HOST=#{target} #{cmd}"
  end

end

namespace :serverspec do
  task :all => hosts.map {|h| 'serverspec:' + h[:name] }
  hosts.each do |host|
    desc "Run serverspec to #{host[:name]}"
    ServerspecTask.new(host[:name].to_sym) do |t|
      t.target = host[:name]
      t.pattern = 'spec/{' + host[:roles].join(',') + '}/*_spec.rb'
    end
  end
end
