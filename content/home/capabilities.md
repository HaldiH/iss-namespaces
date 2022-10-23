+++
weight = 40
+++

{{% section %}}

# CAPABILITIES 

---

#### From a dual view of privilege separation
#### to a set of 41 capabilities

Goal ? 

{{% fragment %}}If a program that has one or more capabilities is compromised, it has less opportunity to do damage than a root process{{% /fragment %}}

---

## The way they should be seen
<br/>

<div style="text-align: left;">
{{% fragment %}}Rather than **giving privileges** to non-privileged processes {{% /fragment %}}
{{% fragment %}}Allows you to **remove privileges** from the all powerful _root_ {{% /fragment %}}
</div>

---

## Thread capabilities sets
- Each user namespace has 5 sets of capabilities that define the capabilities **owned**, those that **can be earned** and those that **can be passed** on through forks.
- The sets: _Effective_, _Permitted_, _Inheritable_, _Bounding_, _Ambient_

---

## Thread capabilities sets

<div style="text-align: left;">
{{% fragment %}} _Effective_ : used by the kernel to any privilege check{{% /fragment %}}
{{% fragment %}} _Permitted_ : can be obtained with _capset_ system call{{% /fragment %}}
{{% fragment %}} _Inheritable_: can be inherited after an execve{{% /fragment %}}
{{% fragment %}} _Bounding_ : used to limit the capabilities that are gained during execve{{% /fragment %}}
{{% fragment %}} _Ambient_ : are preserved across an execve of a program that is not privileged.{{% /fragment %}}
</div>

---

## File capabilities sets
<div style="text-align: left;">
The kernel supports associating capability sets with an executable file, similar as _setuid_.
{{% fragment %}}Each file has 3 sets of capabilities{{% /fragment %}}
{{% fragment %}}_Effective_, _Permitted_, _Inhenitable_{{% /fragment %}}
</div>

---

## File capabilities sets

<div style="text-align: left;">
{{% fragment %}}File capability sets are stored in an extended attribute named security.capability.{{% /fragment %}}
{{% fragment %}}Writing to this attribute needs the CAP_SETFCAP capability.{{% /fragment %}}
{{% fragment %}}File capability sets, in combination with the thread capability sets, will determine the capabilities of a thread after an execve.{{% /fragment %}}
</div>

---

![Capabilities set theorie](capabilities_man.jpg)

---

## File capabilities in Docker

<div style="text-align: left;">
{{% fragment %}}Docker imposes some **limitations** with file capabilities.{{% /fragment %}}
{{% fragment %}}Extended attributes are **removed** when Docker images are built.{{% /fragment %}}
</div>
{{% fragment %}}"This means you will not normally have to concern yourself too much with file capabilities in containers."<br/><a href="https://dockerlabs.collabnix.com/advanced/security/capabilities/#cap_intro">dockerlabs</a>{{% /fragment %}}

{{% /section %}}
