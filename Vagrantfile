# -*- mode: ruby -*-
# vi: set ft=ruby :

# Copyright (C) 2014-2016  Nicolas Lamirault <nicolas.lamirault@gmail.com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

Vagrant::Config.run("2") do |config|

  config.vm.define :scame do |scame_config|

    scame_config.vm.box = "Xenial64"
    scame_config.vm.box_url = "http://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-vagrant.box"
    scame_config.vm.hostname = "Nimbus"
    scame_config.vm.network :private_network, :ip => '10.4.4.4'
    # scame_config.ssh.insert_key = false
    scame_config.ssh.forward_agent = true
    scame_config.ssh.forward_x11 = true

    scame_config.vm.provider :virtualbox do |vb|
      #vb.gui = true
      vb.customize ["modifyvm", :id, "--memory", "1024"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
      vb.name = "Scame"
    end

    # scame_config.vm.provision :shell, :path => "vagrant/provision.sh"

  end

end
