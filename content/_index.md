+++
title = "To Docker and Beyond!"
outputs = ["Reveal"]
+++

# To Docker and Beyond!

by Malik Algelly and Hugo Haldi

---

# Topics

{{< frag c="Linux namespaces" >}}<br/>

{{< frag c="Docker networks" >}}<br/>

{{< frag c="Focus on User Namespaces" >}}<br/>

{{< frag c="Capabilities" >}}<br/>

{{< frag c="Few vulnerabilities and exploits" >}}

---

# WTF are namespaces ?

- Wraps a global system resource for isolation
- Changes made to a resource within a namespace are visible to all the processes inside the namespace, but not to other processes
- One common use is containerization
