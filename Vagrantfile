require "json"

Vagrant.configure("2") do |config|

  servers = JSON.parse(File.read("servers.json"))

  servers.each do |machine|
    config.vm.define machine["name"] do |node|
      config.env.enable
      node.vm.box = machine["box"]
      node.vm.hostname = machine["hostname"]

      node.vm.network machine["network"],
        ip: machine["ip"],
        bridge: ENV["BRIDGE"],
        gateway: ENV["GATEWAY"],
        netmask: ENV["NETMASK"]

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
