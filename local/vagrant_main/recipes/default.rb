include_recipe "apt"
include_recipe "build-essential"
include_recipe "sqlite"
include_recipe "rvm::vagrant"
include_recipe "rvm::system_install"

#install core packages
%w(
  libc6-dev 
  git-core
  wget
  curl
  sqlite3
).each do |pkg_name| 
  package pkg_name do
    action :install
  end
end 

#install Ruby version
rvm_ruby "ruby-1.9.2-p290"

#install default gems
node['rvm']['gems'] = {
  'ruby-1.9.2-p290' => [
  { 'name'    => 'bundler' },
  { 'name'    => 'rake',
    'version' => '0.9.2.2'
  }
  ]
}