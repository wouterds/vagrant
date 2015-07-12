# Variables
VAGRANTFILE_API_VERSION = "2"
VM_BOX = "puphpet/debian75-x64"
MAPPING_DIR_LOCAL = "/Users/MyUsername/www/my-project"
MAPPING_DIR_VM = "/var/www/my-project"
MACHINE_NAME = "Vagrant-MyProject"
MACHINE_CPUS = "2"
MACHINE_MEMORY = "1024"
MACHINE_HOSTNAME = "vagrant-my-project"
MACHINE_IP = "10.10.10.100"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = VM_BOX

	# Private network
	config.vm.network "private_network", ip: MACHINE_IP
	config.vm.hostname = MACHINE_HOSTNAME

	# Folders
	config.vm.synced_folder MAPPING_DIR_LOCAL, MAPPING_DIR_VM, create: false, group: "www-data", owner: "vagrant", :mount_options => ["dmode=777", "fmode=766"]

	# VirtualBox
	config.vm.provider :virtualbox do |vb|
		vb.name = MACHINE_NAME
		vb.customize ["modifyvm", :id, "--memory", MACHINE_MEMORY]
		vb.customize ["modifyvm", :id, "--cpus", MACHINE_CPUS]
		vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
		vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
	end

	# stdin is not a tty fix | src: http://foo-o-rama.com/vagrant--stdin-is-not-a-tty--fix.html
	config.vm.provision "fix-no-tty", type: "shell" do |s|
		s.privileged = false
		s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
	end

	# Provisioning
	config.vm.provision "shell", path: "provision/setup.sh"
end
