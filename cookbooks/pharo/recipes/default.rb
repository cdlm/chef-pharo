#
# Cookbook Name:: pharo
# Recipe:: default
#
# Copyright 2012, Damien Pollet
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

# cookbook_file "/var/chef-package-cache/pharo-vm_#{node[:pharo][:vmversion]}.deb" do
#     source "pharo-vm_#{node[:pharo][:vmversion]}.deb"
#     owner "root"
#     group "root"
#     mode "0444"
# end

remote_file "#{Chef::Config[:file_cache_path]}/#{node[:pharo][:vm_deb_package]}.deb" do
  source "https://github.com/downloads/DamienCassou/pharo-packaging/#{node[:pharo][:vm_deb_package]}.deb"
  checksum node[:pharo][:vm_deb_checksum]
end

package "#{node[:pharo][:vm_deb_package]}.deb" do
  provider Chef::Provider::Package::Dpkg
  source "#{Chef::Config[:file_cache_path]}/#{node[:pharo][:vm_deb_package]}.deb"
  action :install
end
