#
# Cookbook Name:: hadouken
# Recipe:: default
#
# Copyright 2015 Brandon Raabe
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

package_url = node['hadouken']['download_url'] % { version: hadouken_version }

remote_file "#{Chef::Config['file_cache_path']}/#{hadouken_package}" do
  source package_url
end

dpkg_package "#{Chef::Config['file_cache_path']}/#{hadouken_package}"

user hadouken_user do
  home hadouken_home
  manage_home true
  system true
end

directory hadouken_save_path do
  owner hadouken_user
  mode '0755'
end

directory hadouken_state_path do
  owner hadouken_user
  mode '0755'
end

template hadouken_config do
  source 'hadouken.json.erb'
  owner hadouken_user
  group hadouken_user
  mode '0644'
end

template '/etc/init.d/hadouken' do
  source 'hadouken.init.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

template '/etc/default/hadouken' do
  source 'hadouken.defaults.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

service 'hadouken' do
  supports [:restart, :status]
  action [:enable, :start]
end
