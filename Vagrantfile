require "json"

Vagrant.configure("2") do |config|

  servers = JSON.parse(File.read("servers.json"))

  servers.each do |machine|
    config.vm.define machine["name"] do |node|
      node.vm.box = machine["box"]
      node.vm.hostname = machine["hostname"]

      node.vm.network machine["network"],
        ip: machine["ip"],
        bridge: machine["bridge"],
        gateway: machine["gateway"],
        netmask: machine["netmask"]

      node.vm.provider "virtualbox" do |vm|
        vm.cpus = machine["cpu"]
        vm.memory = machine["memory"]
        vm.name = machine["name"]
      end

      node.vm.provision "ansible" do |ansible|
        ansible.playbook = machine["provision"]
        ansible.compatibility_mode = "1.8"
      end
    end
  end
end
