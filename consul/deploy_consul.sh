# make dirs
mkdir -p /etc/consul.d 
cp consul.hcl server.hcl /etc/consul.d

# add users and set proper right for consul
sudo useradd --system --home /etc/consul.d --shell /bin/false consul
sudo mkdir --parents /opt/consul
sudo chown --recursive consul:consul /opt/consul
sudo chown --recursive consul:consul /etc/consul.d

# start service and make it works after reboot
cp  consul.service /etc/systemd/system/
systemctl restart consul.service
systemctl enable consul.service


# for consul-template
mkdir -p ~/consul/template/
cp consul-template.hcl upstream.tpl ~/consul/template

# start service and make it works after reboot
cp  consul-template.service /etc/systemd/system/
systemctl restart consul-template.service
systemctl enable consul-template.service
