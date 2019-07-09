# How to create a network by using virsh

1. Create network
> You need to install virtual machine manager first.

```bash
virsh net-define /path/to/network.xml
virsh net-create {network_name} # The network name is defined in the network.xml.
virsh net-autostart {network_name}
```

2. Bind network to physic net card
> Use `ip a` to look up net card device.

```bash
sudo brctl addif {virtual_bridge_name} {physic net card name}
```
