
Vagrant.configure("2") do |config|
  config.vm.define "erpnext" do |node|
    node.vm.box = "bento/ubuntu-22.04"
    node.vm.hostname = "erpnext"

    node.vm.network "public_network",
      ip: "10.25.10.93",
      bridge: ["eno1"],
      gateway: "10.25.10.1",
      netmask: "255.255.255.0"

    node.vm.provider "virtualbox" do |vm|
      vm.cpus = "2"
      vm.memory = "4096"
      vm.name = "erpnext"
    end

    node.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbooks/vagrant.yml"
      ansible.compatibility_mode = "1.8"
    end
  end
end
