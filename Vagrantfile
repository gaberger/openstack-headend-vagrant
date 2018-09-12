# Verify whether required plugins are installed.
#required_plugins = [ "vagrant-disksize" ]
#required_plugins.each do |plugin|
#  if not Vagrant.has_plugin?(plugin)
#    raise "The vagrant plugin #{plugin} is required. Please run `vagrant plugin install #{plugin}`"
#  end
#end

Vagrant.configure(2) do |config|

  # Configure all VM specs.
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  # config.vm.synced_folder ".", "/vagrant", type: "rsync"

  # Configure the disk size.
  # disk_size = "60GB"

  config.vm.define "ubuntu1604" do |xenial|
    xenial.vm.box = "ubuntu/xenial64"
    config.ssh.forward_agent = true
    config.ssh.private_key_path = ["~/.ssh/id_rsa", "~/.vagrant.d/insecure_private_key"]
    config.ssh.insert_key = false
    config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"
    config.vm.provision "shell",
      privileged: true,
      inline: <<-SHELL
          cd /vagrant
          apt-get update
      	  apt-get dist-upgrade
          apt-get install -y unzip aptitude build-essential git ntp ntpdate openssh-server python-dev sudo wget python-pip
	  pip install pyaml
      	  git clone -b master https://github.com/openstack/openstack-ansible.git /opt/openstack-ansible
          mkdir -p /etc/openstack_deploy && cp -R /opt/openstack-ansible/etc/openstack_deploy/* /etc/openstack_deploy/
      	  pushd /etc/openstack_deploy
      	  cp openstack_user_config.yml.example openstack_user_config.yml
	  pushd /opt/openstack-ansible
	  python scripts/pw-token-gen.py  --file  /etc/openstack_deploy/user_secrets.yml
	  pushd /opt/openstack-ansible/playbooks
	  wget https://github.com/nbering/terraform-provider-ansible/releases/download/v0.0.4/terraform-provider-ansible-linux_amd64.zip
	  unzip terraform-provider-ansible-linux_amd64.zip && mkdir -p /home/ubuntu/.terraform.d/plugins && mv linux_amd64/terraform-provider-ansible_v0.0.4 /home/ubuntu/.terraform.d/plugins
	  wget https://raw.githubusercontent.com/nbering/terraform-inventory/master/terraform.py && chmod u+x terraform.py
	  cp /vagrant/terraform/* .
	  mv terraform /usr/local/bin
	  chown -R ubuntu:ubuntu /opt/openstack-ansible
      	  ../scripts/bootstrap-ansible.sh
	  #terraform init
          SHELL
    end
end

