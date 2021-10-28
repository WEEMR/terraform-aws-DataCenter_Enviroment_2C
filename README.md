# DataCenter Enviroment 2C

To use this module Please go to (https://github.com/waleedrady/AWS_Cloud_DC_Environment_2C)

Terraform Module that will create the AWS Networking Stack with FGT, Apache Server, Windows Server and utilize AWS Route53 for DNS. 

The module will create the below resources:

- 2 x VPCs, one of Hub and one for Spoke
- Networking Stack (VPC, Subnets, Route Tables, Security Groups and Internet Gateway) - Please refer to the diagram below.
- 2 x FortiGate with 3 interfaces (Two Interfaces in two different Public Subnets and one in the Private subnets)
- Windows Server 2019 Behind the FGT Port 3 [LAN]
- Ubunutu Server with Apache installed, iperf, fzf, pydf, firefox, lynx and elinks installed on it behind the FGT port 3 [LAN]
- Route53 DNS Public Hosted Zones
- FortiManager and FortiAnalyzer will be deployed as well behind the Hub FGT on Port 3 [LAN]


![image](https://user-images.githubusercontent.com/82145296/139328604-eac6b26b-3478-41b0-96dd-0cec3e7c7cd0.png)


// The DNS Hosted Zones must be sub-zones for a domain that is registered or managed by AWS Route53 //

// i.e xyz.com is the domain name and you will create the subzone Lab1.xyz.com // 

![image](https://user-images.githubusercontent.com/82145296/139328480-89548d95-0950-44f6-a04e-b64b3a882d7c.png)
