+++
weight = 20
+++

{{% section %}}

# Docker Networks

---

## Network types

{{% fragment %}}bridge{{% /fragment %}}
{{% fragment %}}host{{% /fragment %}}
{{% fragment %}}overlay{{% /fragment %}}
{{% fragment %}}ipvlan{{% /fragment %}}
{{% fragment %}}macvlan{{% /fragment %}}
{{% fragment %}}none{{% /fragment %}}
{{% fragment %}}third parties{{% /fragment %}}

---

### Bridge network

- Default network driver (when you don't specify a network)
- Software bridge that is used to connect containers to communicate
- Only the containers connected to the same bridge can see each others

---

![Network bridge](net_bridge.jpg)

---

### Host network

- Do not create a new network namespace
- Run the container inside the current network namespace

---

### IPvlan L2

![IPvlan L2](ipvlan_l2_simple.png)

---

### MACvlan

Similar to IPvlan but assign a MAC adress to containers, making them visible as real devices on the network.

Useful for applications that analyse network traffic.

---

### And more

None, Overlay, third parties drivers, ...

{{% /section %}}
