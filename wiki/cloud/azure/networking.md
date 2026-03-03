# Networking

## Virtual Networking

- A virtual networking is a resource to isolate the comunication and trafic between the related resources.

## Networking peering
- A peering is an azure resource to connect to Virtual Networking.

## Subnet
- A subnet is a networking isolation inside a virtual networking.

## VPN Gateway

- A VPN Gateway allow create a connection between an azure Virtual network to a on-premisse network.

## Load Balancers

- A load balance is a service that distributes the trafic between VMs or other resources in azure.

- Load balancers support inbound (traffic inside the virtual network) and outbound traffic (internet trafic).

- Load balancer help in high-availability and scalability of applications.

- Load balancer wasn't designed to web traffic. (non-http)

## NSG (Network Security Group)

- Security Groups allow to create a security rules to filter traffic inside a virtual network.

## Application Gateway

- Application Gateway is a service created to distribute http traffic.

- Is a web traffic load balancer.

- Has a web apllication firewall, do redirections, session affinity, URL routing, and decripty https to http.

## CDN (Content Delivery Network)

- Delivery the web content to user by a the most next path.
- The goal is minimize the latency to delivery static files.