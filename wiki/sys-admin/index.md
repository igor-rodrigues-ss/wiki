# Bridge network

- Configuring a bridge network with netplan
- This configurations is required to use bridge networks on cockpit's VMs
```shell

echo "network:
  version: 2
  renderer: networkd
  ethernets:
    enp2s0:
      dhcp4: no
  bridges:
    br0:
      interfaces: [enp2s0]
      dhcp4: true" | sudo tee /etc/netplan/01-netcfg.yaml > /dev/null

sudo netplan apply
```