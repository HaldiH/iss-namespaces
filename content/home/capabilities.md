+++
weight = 40
+++

{{% section %}}

# CAPABILITIES

---

#### From a binary privileges perspective<br/>to a set of 41 capabilities

Goal?

{{% fragment %}}If a program that has one or more capabilities is compromised, it has less opportunity to do damage than a root process{{% /fragment %}}

---

{{< slide class="align-left" >}}

## The way they should be seen
<br/>

{{% fragment %}}Rather than **giving privileges** to non-privileged processes,{{% /fragment %}}
{{% fragment %}}allows you to **remove privileges** from the all powerful _root_ {{% /fragment %}}

---

## Thread capabilities sets

- Each user namespace has 5 sets of capabilities that define the capabilities **owned**, those that **can be earned** and those that **can be passed** on through forks.
- The sets: _Effective_, _Permitted_, _Inheritable_, _Bounding_, _Ambient_

---

{{< slide class="align-left" >}}

## Thread capabilities sets

{{% fragment %}} _Effective_ : used by the kernel to any privilege check{{% /fragment %}}
{{% fragment %}} _Permitted_ : can be obtained with _capset_ system call{{% /fragment %}}
{{% fragment %}} _Inheritable_: can be inherited after an execve{{% /fragment %}}
{{% fragment %}} _Bounding_ : used to limit the capabilities that are gained during execve{{% /fragment %}}
{{% fragment %}} _Ambient_ : are preserved across an `execve` of a program that is not privileged.{{% /fragment %}}

---

{{< slide class="align-left" >}}

## File capabilities sets

The kernel supports associating capability sets with an executable file, similar to _setuid_.
{{% fragment %}}Each file has 3 sets of capabilities{{% /fragment %}}
{{% fragment %}}_Effective_, _Permitted_, _Inhenitable_{{% /fragment %}}

---

{{< slide class="align-left" >}}

## File capabilities sets

{{% fragment %}}File capability sets are stored in an extended attribute named `security.capability`.{{% /fragment %}}
{{% fragment %}}Writing to this attribute needs the CAP_SETFCAP capability.{{% /fragment %}}
{{% fragment %}}File capability sets, in combination with the thread capability sets, will determine the capabilities of a thread after an `execve`.{{% /fragment %}}

---

![Capabilities set theorie](capabilities_man.jpg)

---

{{< slide class="align-left-2" >}}

## File capabilities in Docker

{{% fragment %}}Docker imposes some **limitations** with file capabilities.{{% /fragment %}}
{{% fragment %}}Extended attributes are **removed** when Docker images are built.{{% /fragment %}}
{{% fragment %}}"This means you will not normally have to concern yourself too much with file capabilities in containers."<br/><a href="https://dockerlabs.collabnix.com/advanced/security/capabilities/#cap_intro">dockerlabs</a>{{% /fragment %}}

{{% /section %}}
