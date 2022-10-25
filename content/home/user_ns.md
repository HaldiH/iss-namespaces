+++
weight = 30
+++

{{% section %}}

# User namespaces

---

- Isolate identifiers and attributes ({U,G}ID, root directory, capabilities, ...)
- UID and GID can be different inside and outside a user NS
- Process can have unprivilieged UID outside a user NS, while having a UID of 0 inside the user NS.
- The process that creates the new user NS gains all the capabilities inside the new user NS.

---

## Hierarchy

- User NS have a hierarchical relationship, every of them have a parent except for the initial user NS.
- User NS can have multiple children user NS
- Maxumim of 32 nested user NS.

---

- A process is member of exactly one user NS
- A user NS can own other NS (network, PID, ...)
- Capabilities only apply to the resources that are member of the NS owned by the current user NS
- E.g. a process having `CAP_NET_ADMIN` can only modify network interfaces that are in a network NS owned by the process user NS.

---

![User namespace example](user_ns.svg)

_Schema from [this conference by Michael Kerrisk](https://youtu.be/73nB9-HYbAI)_

{{% /section %}}
