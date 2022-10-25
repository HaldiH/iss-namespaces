+++
weight = 10
+++

{{% section %}}

# Linux Namespaces

---

## Existing namespaces

- UTS
- PID
- Mount
- Network
- User

<br/>
{{< frag c="IPC, Cgroup, Time, ..." >}}

---

### UTS

- Isolate hostname and domain name between processes
- Changes made to the hostname from a process inside a UTS namespace are visible to all the processes within this namespace
- However, the processes outside the UTS namespace cannot see the changes

---

- A child fork inherit the UTS namespace of its parent
- When a process creates a new UTS namespace, hostname and domain name are inherited from the caller

---

{{< slide class="side-by-side" >}}

#### Demo

```bash
$ hostname
ms-7917

# waiting for the new UTS
# namespace to change hostname
$ hostname
ms-7917

# change the hostname in the
# initial UTS namespace
$ hostname yggdrasil
```

```bash
$ unshare -u
$ hostname
ms-7917

# change the hostname in
# the new UTS namespace
$ hostname thor
$ hostname
thor

# wait for the initial UTS
# namespace to change hostname
$ hostname
thor
```

---

### PID

- Isolate the process ID number space
- Different process in different namespaces can have the same PID
- The first process in this new namespace becomes the _init_ process and get the PID 1 in this new namespace
- Useful to migrate containers between systems without inducing collisions.

---

- _init_ becomes the parent of orphans processes inside the namespace
- when it dies, the kernel will terminate all its children via SIGKILL.
- PID namespaces have **hierarchical relationship**
- Processes from parents PID namespaces can see all the processes within the child PID namespaces. **The opposite is not true**.

---

![PID Namespaces hierarchie](pid_namespaces.svg)

_Schema from [this conference by Michael Kerrisk](https://youtu.be/0kJPa-1FuoI)_

---

### Demo

```shell
$ sudo unshare -p -f
$ echo $$
1
$ ps
    PID TTY          TIME CMD
  39352 pts/3    00:00:00 sudo
  39353 pts/3    00:00:00 unshare
  39354 pts/3    00:00:02 bash
  49657 pts/3    00:00:00 ps
```

---

### Mount

- Isolation of mount points per process
- Copy the mount namespace of the caller

---

### Demo (contd)

```shell
$ sudo unshare -p -f -m
$ mount -t proc none /proc
$ echo $$
1
$ ps
    PID TTY          TIME CMD
      1 pts/3    00:00:00 bash
     32 pts/3    00:00:00 ps
```

---

### Network

- Per process isolation on network devices
- One network device can be attached to exactly one network namespace
- We can use virtual network device pair to provide pipe-like tunnels between networks, attaching each element of the pair to a specific network namespace
- When a namespace is freed, a physical device is moved back to the initial network namespace while a virtual device is destroyed

---

### Demo

```shell
ip netns add loki
ip link add eth0-l type veth peer name veth-l
ip link set eth0-l netns loki
ip link set veth-l up
ip address add 10.0.0.1/24 dev veth-l
ip netns exec loki ip link set lo up
ip netns exec loki ip link set eth0-l up
ip netns exec loki ip address add 10.0.0.2/24 dev eth0-l
```

{{% /section %}}
