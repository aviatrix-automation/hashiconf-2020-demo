<img src="https://2ujst446wdhv3307z249ttp0-wpengine.netdna-ssl.com/wp-content/themes/aviatrix/resources/images/logo.svg" style="width:125px;"/>

# HashiConf Digital 2020 Demo

### Summary

This is a simple demonstration of the Aviatrix Terraform provider that shows the power of abstraction, consistency, and repeatability. These capabilities hold true across AWS, Azure, GCP, and OCI.
Reference documentation for the Aviatrix VPC resource can be found [here.](https://registry.terraform.io/providers/AviatrixSystems/aviatrix/latest/docs/resources/aviatrix_vpc)

### Bill of Materials

- 1 AWS VPC will be created 
- 3 Text files ```describe-vpcs.txt, describe-subnets.txt, and describe-route-tables.txt``` will be created in the working directory to show what is created by the aviatrix-vpc terraform resource

### Prerequisites

- Aviatrix Controller with Access Account defined for AWS 
- terraform .12 in the user environment ```terraform -v```
- aws cli installed and configured in your environment with the default region in ```~/.aws/config``` being the same as the region defined in ```terraform.tfvars```

### Workflow

- Modify ```terraform.tfvars``` with your Aviatrix Controller values
- ```terraform init```
- ```terraform plan```
- ```terraform apply --auto-approve```

### Software Version Requirements

Component | Version
--- | ---
Aviatrix Controller | 6.1
Aviatrix Terraform Provider | 2.16.2
Terraform | 0.12
AWS CLI | >= 1.16

### Sample Output

#### describe-vpcs.txt

```
$ cat describe-vpcs.txt
------------------------------------------------------------------------------
|                                DescribeVpcs                                |
+----------------------------------------------------------------------------+
||                                   Vpcs                                   ||
|+-------------------------------+------------------------------------------+|
||  CidrBlock                    |  10.0.0.0/16                             ||
||  DhcpOptionsId                |  dopt-b5b74dcf                           ||
||  InstanceTenancy              |  default                                 ||
||  IsDefault                    |  False                                   ||
||  OwnerId                      |  123456789                            ||
||  State                        |  available                               ||
||  VpcId                        |  vpc-0ad8269a5ef8e3af7                   ||
|+-------------------------------+------------------------------------------+|
|||                         CidrBlockAssociationSet                        |||
||+----------------------+-------------------------------------------------+||
|||  AssociationId       |  vpc-cidr-assoc-05b79b7cbe47c4d59               |||
|||  CidrBlock           |  10.0.0.0/16                                    |||
||+----------------------+-------------------------------------------------+||
||||                            CidrBlockState                            ||||
|||+--------------------------+-------------------------------------------+|||
||||  State                   |  associated                               ||||
|||+--------------------------+-------------------------------------------+|||
|||                                  Tags                                  |||
||+----------------------------+-------------------------------------------+||
|||             Key            |                   Value                   |||
||+----------------------------+-------------------------------------------+||
|||  Name                      |  hashiconf-demo                           |||
|||  Aviatrix-Created-Resource |  Do-Not-Delete-Aviatrix-Created-Resource  |||
||+----------------------------+-------------------------------------------+||
```

#### describe-subnets.txt

```
tm-mbp16:hashiconf-demo travis$ cat describe-subnets.txt
---------------------------------------------------------------------------------------------------------
|                                            DescribeSubnets                                            |
+-------------------------------------------------------------------------------------------------------+
||                                               Subnets                                               ||
|+------------------------------+----------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                               ||
||  AvailabilityZone            |  us-east-1a                                                          ||
||  AvailabilityZoneId          |  use1-az1                                                            ||
||  AvailableIpAddressCount     |  4091                                                                ||
||  CidrBlock                   |  10.0.16.0/20                                                        ||
||  DefaultForAz                |  False                                                               ||
||  MapPublicIpOnLaunch         |  False                                                               ||
||  OwnerId                     |  123456789                                                        ||
||  State                       |  available                                                           ||
||  SubnetArn                   |  arn:aws:ec2:us-east-1:123456789:subnet/subnet-0a5a4fcfe58779a16  ||
||  SubnetId                    |  subnet-0a5a4fcfe58779a16                                            ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                                               ||
|+------------------------------+----------------------------------------------------------------------+|
|||                                               Tags                                                |||
||+---------------------------------------+-----------------------------------------------------------+||
|||                  Key                  |                           Value                           |||
||+---------------------------------------+-----------------------------------------------------------+||
|||  hashiconf-demo                       |  subnet1-private                                          |||
|||  Aviatrix-Created-Resource            |  Do-Not-Delete-Aviatrix-Created-Resource                  |||
|||  Name                                 |  hashiconf-demo-Private-0-us-east-1a                      |||
||+---------------------------------------+-----------------------------------------------------------+||
||                                               Subnets                                               ||
|+------------------------------+----------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                               ||
||  AvailabilityZone            |  us-east-1a                                                          ||
||  AvailabilityZoneId          |  use1-az1                                                            ||
||  AvailableIpAddressCount     |  4091                                                                ||
||  CidrBlock                   |  10.0.112.0/20                                                       ||
||  DefaultForAz                |  False                                                               ||
||  MapPublicIpOnLaunch         |  False                                                               ||
||  OwnerId                     |  123456789                                                        ||
||  State                       |  available                                                           ||
||  SubnetArn                   |  arn:aws:ec2:us-east-1:123456789:subnet/subnet-048568a00dc534960  ||
||  SubnetId                    |  subnet-048568a00dc534960                                            ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                                               ||
|+------------------------------+----------------------------------------------------------------------+|
|||                                               Tags                                                |||
||+---------------------------------------+-----------------------------------------------------------+||
|||                  Key                  |                           Value                           |||
||+---------------------------------------+-----------------------------------------------------------+||
|||  Name                                 |  hashiconf-demo-Public-0-us-east-1a                       |||
|||  hashiconf-demo                       |  subnet7-public                                           |||
|||  Aviatrix-Created-Resource            |  Do-Not-Delete-Aviatrix-Created-Resource                  |||
||+---------------------------------------+-----------------------------------------------------------+||
||                                               Subnets                                               ||
|+------------------------------+----------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                               ||
||  AvailabilityZone            |  us-east-1f                                                          ||
||  AvailabilityZoneId          |  use1-az5                                                            ||
||  AvailableIpAddressCount     |  4091                                                                ||
||  CidrBlock                   |  10.0.96.0/20                                                        ||
||  DefaultForAz                |  False                                                               ||
||  MapPublicIpOnLaunch         |  False                                                               ||
||  OwnerId                     |  123456789                                                        ||
||  State                       |  available                                                           ||
||  SubnetArn                   |  arn:aws:ec2:us-east-1:123456789:subnet/subnet-0e58632f922d030d6  ||
||  SubnetId                    |  subnet-0e58632f922d030d6                                            ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                                               ||
|+------------------------------+----------------------------------------------------------------------+|
|||                                               Tags                                                |||
||+---------------------------------------+-----------------------------------------------------------+||
|||                  Key                  |                           Value                           |||
||+---------------------------------------+-----------------------------------------------------------+||
|||  Name                                 |  hashiconf-demo-Private-5-us-east-1f                      |||
|||  hashiconf-demo                       |  subnet6-private                                          |||
|||  Aviatrix-Created-Resource            |  Do-Not-Delete-Aviatrix-Created-Resource                  |||
||+---------------------------------------+-----------------------------------------------------------+||
||                                               Subnets                                               ||
|+------------------------------+----------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                               ||
||  AvailabilityZone            |  us-east-1d                                                          ||
||  AvailabilityZoneId          |  use1-az6                                                            ||
||  AvailableIpAddressCount     |  4091                                                                ||
||  CidrBlock                   |  10.0.64.0/20                                                        ||
||  DefaultForAz                |  False                                                               ||
||  MapPublicIpOnLaunch         |  False                                                               ||
||  OwnerId                     |  123456789                                                        ||
||  State                       |  available                                                           ||
||  SubnetArn                   |  arn:aws:ec2:us-east-1:123456789:subnet/subnet-04b4ee0fb1fb77827  ||
||  SubnetId                    |  subnet-04b4ee0fb1fb77827                                            ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                                               ||
|+------------------------------+----------------------------------------------------------------------+|
|||                                               Tags                                                |||
||+---------------------------------------+-----------------------------------------------------------+||
|||                  Key                  |                           Value                           |||
||+---------------------------------------+-----------------------------------------------------------+||
|||  hashiconf-demo                       |  subnet4-private                                          |||
|||  Aviatrix-Created-Resource            |  Do-Not-Delete-Aviatrix-Created-Resource                  |||
|||  Name                                 |  hashiconf-demo-Private-3-us-east-1d                      |||
||+---------------------------------------+-----------------------------------------------------------+||
||                                               Subnets                                               ||
|+------------------------------+----------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                               ||
||  AvailabilityZone            |  us-east-1f                                                          ||
||  AvailabilityZoneId          |  use1-az5                                                            ||
||  AvailableIpAddressCount     |  4091                                                                ||
||  CidrBlock                   |  10.0.192.0/20                                                       ||
||  DefaultForAz                |  False                                                               ||
||  MapPublicIpOnLaunch         |  False                                                               ||
||  OwnerId                     |  123456789                                                        ||
||  State                       |  available                                                           ||
||  SubnetArn                   |  arn:aws:ec2:us-east-1:123456789:subnet/subnet-04f5b2b6442b1c402  ||
||  SubnetId                    |  subnet-04f5b2b6442b1c402                                            ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                                               ||
|+------------------------------+----------------------------------------------------------------------+|
|||                                               Tags                                                |||
||+---------------------------------------+-----------------------------------------------------------+||
|||                  Key                  |                           Value                           |||
||+---------------------------------------+-----------------------------------------------------------+||
|||  Aviatrix-Created-Resource            |  Do-Not-Delete-Aviatrix-Created-Resource                  |||
|||  Name                                 |  hashiconf-demo-Public-5-us-east-1f                       |||
|||  hashiconf-demo                       |  subnet12-public                                          |||
||+---------------------------------------+-----------------------------------------------------------+||
||                                               Subnets                                               ||
|+------------------------------+----------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                               ||
||  AvailabilityZone            |  us-east-1e                                                          ||
||  AvailabilityZoneId          |  use1-az3                                                            ||
||  AvailableIpAddressCount     |  4091                                                                ||
||  CidrBlock                   |  10.0.176.0/20                                                       ||
||  DefaultForAz                |  False                                                               ||
||  MapPublicIpOnLaunch         |  False                                                               ||
||  OwnerId                     |  123456789                                                        ||
||  State                       |  available                                                           ||
||  SubnetArn                   |  arn:aws:ec2:us-east-1:123456789:subnet/subnet-0451f2bdb5aa33dd3  ||
||  SubnetId                    |  subnet-0451f2bdb5aa33dd3                                            ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                                               ||
|+------------------------------+----------------------------------------------------------------------+|
|||                                               Tags                                                |||
||+---------------------------------------+-----------------------------------------------------------+||
|||                  Key                  |                           Value                           |||
||+---------------------------------------+-----------------------------------------------------------+||
|||  Name                                 |  hashiconf-demo-Public-4-us-east-1e                       |||
|||  Aviatrix-Created-Resource            |  Do-Not-Delete-Aviatrix-Created-Resource                  |||
|||  hashiconf-demo                       |  subnet11-public                                          |||
||+---------------------------------------+-----------------------------------------------------------+||
||                                               Subnets                                               ||
|+------------------------------+----------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                               ||
||  AvailabilityZone            |  us-east-1b                                                          ||
||  AvailabilityZoneId          |  use1-az2                                                            ||
||  AvailableIpAddressCount     |  4091                                                                ||
||  CidrBlock                   |  10.0.32.0/20                                                        ||
||  DefaultForAz                |  False                                                               ||
||  MapPublicIpOnLaunch         |  False                                                               ||
||  OwnerId                     |  123456789                                                        ||
||  State                       |  available                                                           ||
||  SubnetArn                   |  arn:aws:ec2:us-east-1:123456789:subnet/subnet-0608a6ed2bfe27812  ||
||  SubnetId                    |  subnet-0608a6ed2bfe27812                                            ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                                               ||
|+------------------------------+----------------------------------------------------------------------+|
|||                                               Tags                                                |||
||+---------------------------------------+-----------------------------------------------------------+||
|||                  Key                  |                           Value                           |||
||+---------------------------------------+-----------------------------------------------------------+||
|||  hashiconf-demo                       |  subnet2-private                                          |||
|||  Aviatrix-Created-Resource            |  Do-Not-Delete-Aviatrix-Created-Resource                  |||
|||  Name                                 |  hashiconf-demo-Private-1-us-east-1b                      |||
||+---------------------------------------+-----------------------------------------------------------+||
||                                               Subnets                                               ||
|+------------------------------+----------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                               ||
||  AvailabilityZone            |  us-east-1c                                                          ||
||  AvailabilityZoneId          |  use1-az4                                                            ||
||  AvailableIpAddressCount     |  4091                                                                ||
||  CidrBlock                   |  10.0.48.0/20                                                        ||
||  DefaultForAz                |  False                                                               ||
||  MapPublicIpOnLaunch         |  False                                                               ||
||  OwnerId                     |  123456789                                                        ||
||  State                       |  available                                                           ||
||  SubnetArn                   |  arn:aws:ec2:us-east-1:123456789:subnet/subnet-01c232b0c5733b68a  ||
||  SubnetId                    |  subnet-01c232b0c5733b68a                                            ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                                               ||
|+------------------------------+----------------------------------------------------------------------+|
|||                                               Tags                                                |||
||+---------------------------------------+-----------------------------------------------------------+||
|||                  Key                  |                           Value                           |||
||+---------------------------------------+-----------------------------------------------------------+||
|||  hashiconf-demo                       |  subnet3-private                                          |||
|||  Aviatrix-Created-Resource            |  Do-Not-Delete-Aviatrix-Created-Resource                  |||
|||  Name                                 |  hashiconf-demo-Private-2-us-east-1c                      |||
||+---------------------------------------+-----------------------------------------------------------+||
||                                               Subnets                                               ||
|+------------------------------+----------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                               ||
||  AvailabilityZone            |  us-east-1b                                                          ||
||  AvailabilityZoneId          |  use1-az2                                                            ||
||  AvailableIpAddressCount     |  4091                                                                ||
||  CidrBlock                   |  10.0.128.0/20                                                       ||
||  DefaultForAz                |  False                                                               ||
||  MapPublicIpOnLaunch         |  False                                                               ||
||  OwnerId                     |  123456789                                                        ||
||  State                       |  available                                                           ||
||  SubnetArn                   |  arn:aws:ec2:us-east-1:123456789:subnet/subnet-0ea74dbaafa376f86  ||
||  SubnetId                    |  subnet-0ea74dbaafa376f86                                            ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                                               ||
|+------------------------------+----------------------------------------------------------------------+|
|||                                               Tags                                                |||
||+---------------------------------------+-----------------------------------------------------------+||
|||                  Key                  |                           Value                           |||
||+---------------------------------------+-----------------------------------------------------------+||
|||  Name                                 |  hashiconf-demo-Public-1-us-east-1b                       |||
|||  Aviatrix-Created-Resource            |  Do-Not-Delete-Aviatrix-Created-Resource                  |||
|||  hashiconf-demo                       |  subnet8-public                                           |||
||+---------------------------------------+-----------------------------------------------------------+||
||                                               Subnets                                               ||
|+------------------------------+----------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                               ||
||  AvailabilityZone            |  us-east-1c                                                          ||
||  AvailabilityZoneId          |  use1-az4                                                            ||
||  AvailableIpAddressCount     |  4091                                                                ||
||  CidrBlock                   |  10.0.144.0/20                                                       ||
||  DefaultForAz                |  False                                                               ||
||  MapPublicIpOnLaunch         |  False                                                               ||
||  OwnerId                     |  123456789                                                        ||
||  State                       |  available                                                           ||
||  SubnetArn                   |  arn:aws:ec2:us-east-1:123456789:subnet/subnet-0e02df59e852d7535  ||
||  SubnetId                    |  subnet-0e02df59e852d7535                                            ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                                               ||
|+------------------------------+----------------------------------------------------------------------+|
|||                                               Tags                                                |||
||+---------------------------------------+-----------------------------------------------------------+||
|||                  Key                  |                           Value                           |||
||+---------------------------------------+-----------------------------------------------------------+||
|||  Aviatrix-Created-Resource            |  Do-Not-Delete-Aviatrix-Created-Resource                  |||
|||  Name                                 |  hashiconf-demo-Public-2-us-east-1c                       |||
|||  hashiconf-demo                       |  subnet9-public                                           |||
||+---------------------------------------+-----------------------------------------------------------+||
||                                               Subnets                                               ||
|+------------------------------+----------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                               ||
||  AvailabilityZone            |  us-east-1e                                                          ||
||  AvailabilityZoneId          |  use1-az3                                                            ||
||  AvailableIpAddressCount     |  4091                                                                ||
||  CidrBlock                   |  10.0.80.0/20                                                        ||
||  DefaultForAz                |  False                                                               ||
||  MapPublicIpOnLaunch         |  False                                                               ||
||  OwnerId                     |  123456789                                                        ||
||  State                       |  available                                                           ||
||  SubnetArn                   |  arn:aws:ec2:us-east-1:123456789:subnet/subnet-051582a46ece3ae61  ||
||  SubnetId                    |  subnet-051582a46ece3ae61                                            ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                                               ||
|+------------------------------+----------------------------------------------------------------------+|
|||                                               Tags                                                |||
||+---------------------------------------+-----------------------------------------------------------+||
|||                  Key                  |                           Value                           |||
||+---------------------------------------+-----------------------------------------------------------+||
|||  Aviatrix-Created-Resource            |  Do-Not-Delete-Aviatrix-Created-Resource                  |||
|||  Name                                 |  hashiconf-demo-Private-4-us-east-1e                      |||
|||  hashiconf-demo                       |  subnet5-private                                          |||
||+---------------------------------------+-----------------------------------------------------------+||
||                                               Subnets                                               ||
|+------------------------------+----------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                               ||
||  AvailabilityZone            |  us-east-1d                                                          ||
||  AvailabilityZoneId          |  use1-az6                                                            ||
||  AvailableIpAddressCount     |  4091                                                                ||
||  CidrBlock                   |  10.0.160.0/20                                                       ||
||  DefaultForAz                |  False                                                               ||
||  MapPublicIpOnLaunch         |  False                                                               ||
||  OwnerId                     |  123456789                                                        ||
||  State                       |  available                                                           ||
||  SubnetArn                   |  arn:aws:ec2:us-east-1:123456789:subnet/subnet-0bc5180c9b48dc393  ||
||  SubnetId                    |  subnet-0bc5180c9b48dc393                                            ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                                               ||
|+------------------------------+----------------------------------------------------------------------+|
|||                                               Tags                                                |||
||+---------------------------------------+-----------------------------------------------------------+||
|||                  Key                  |                           Value                           |||
||+---------------------------------------+-----------------------------------------------------------+||
|||  Aviatrix-Created-Resource            |  Do-Not-Delete-Aviatrix-Created-Resource                  |||
|||  hashiconf-demo                       |  subnet10-public                                          |||
|||  Name                                 |  hashiconf-demo-Public-3-us-east-1d                       |||
||+---------------------------------------+-----------------------------------------------------------+||
```

#### describe-route-tables.txt

```
$ cat describe-route-tables.txt
-------------------------------------------------------------------------------------
|                                DescribeRouteTables                                |
+-----------------------------------------------------------------------------------+
||                                   RouteTables                                   ||
|+------------------------------+--------------------------------------------------+|
||  OwnerId                     |  123456789                                    ||
||  RouteTableId                |  rtb-0f0e855c1869c8c9b                           ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                           ||
|+------------------------------+--------------------------------------------------+|
|||                                 Associations                                  |||
||+------------------------------------+------------------------------------------+||
|||  Main                              |  False                                   |||
|||  RouteTableAssociationId           |  rtbassoc-045456629a4c8d049              |||
|||  RouteTableId                      |  rtb-0f0e855c1869c8c9b                   |||
|||  SubnetId                          |  subnet-04b4ee0fb1fb77827                |||
||+------------------------------------+------------------------------------------+||
||||                              AssociationState                               ||||
|||+-----------------------------+-----------------------------------------------+|||
||||  State                      |  associated                                   ||||
|||+-----------------------------+-----------------------------------------------+|||
|||                                    Routes                                     |||
||+------------------------------------------+------------------------------------+||
|||  DestinationCidrBlock                    |  10.0.0.0/16                       |||
|||  GatewayId                               |  local                             |||
|||  Origin                                  |  CreateRouteTable                  |||
|||  State                                   |  active                            |||
||+------------------------------------------+------------------------------------+||
|||                                     Tags                                      |||
||+-------------------------------+-----------------------------------------------+||
|||              Key              |                     Value                     |||
||+-------------------------------+-----------------------------------------------+||
|||  Name                         |  hashiconf-demo-Private-3-us-east-1d-rtb      |||
|||  Aviatrix-Created-Resource    |  Do-Not-Delete-Aviatrix-Created-Resource      |||
|||  hashiconf-demo               |  hashiconf-demo-Private-3-us-east-1d-rtb      |||
||+-------------------------------+-----------------------------------------------+||
||                                   RouteTables                                   ||
|+------------------------------+--------------------------------------------------+|
||  OwnerId                     |  123456789                                    ||
||  RouteTableId                |  rtb-00ac0c55f5f0a07a4                           ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                           ||
|+------------------------------+--------------------------------------------------+|
|||                                 Associations                                  |||
||+------------------------------------+------------------------------------------+||
|||  Main                              |  False                                   |||
|||  RouteTableAssociationId           |  rtbassoc-00feca9ff729b32e9              |||
|||  RouteTableId                      |  rtb-00ac0c55f5f0a07a4                   |||
|||  SubnetId                          |  subnet-0608a6ed2bfe27812                |||
||+------------------------------------+------------------------------------------+||
||||                              AssociationState                               ||||
|||+-----------------------------+-----------------------------------------------+|||
||||  State                      |  associated                                   ||||
|||+-----------------------------+-----------------------------------------------+|||
|||                                    Routes                                     |||
||+------------------------------------------+------------------------------------+||
|||  DestinationCidrBlock                    |  10.0.0.0/16                       |||
|||  GatewayId                               |  local                             |||
|||  Origin                                  |  CreateRouteTable                  |||
|||  State                                   |  active                            |||
||+------------------------------------------+------------------------------------+||
|||                                     Tags                                      |||
||+-------------------------------+-----------------------------------------------+||
|||              Key              |                     Value                     |||
||+-------------------------------+-----------------------------------------------+||
|||  Name                         |  hashiconf-demo-Private-1-us-east-1b-rtb      |||
|||  Aviatrix-Created-Resource    |  Do-Not-Delete-Aviatrix-Created-Resource      |||
|||  hashiconf-demo               |  hashiconf-demo-Private-1-us-east-1b-rtb      |||
||+-------------------------------+-----------------------------------------------+||
||                                   RouteTables                                   ||
|+------------------------------+--------------------------------------------------+|
||  OwnerId                     |  123456789                                    ||
||  RouteTableId                |  rtb-0f4bc8dcf8913adb6                           ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                           ||
|+------------------------------+--------------------------------------------------+|
|||                                 Associations                                  |||
||+------------------------------------+------------------------------------------+||
|||  Main                              |  False                                   |||
|||  RouteTableAssociationId           |  rtbassoc-0321ef2760703fbcf              |||
|||  RouteTableId                      |  rtb-0f4bc8dcf8913adb6                   |||
|||  SubnetId                          |  subnet-01c232b0c5733b68a                |||
||+------------------------------------+------------------------------------------+||
||||                              AssociationState                               ||||
|||+-----------------------------+-----------------------------------------------+|||
||||  State                      |  associated                                   ||||
|||+-----------------------------+-----------------------------------------------+|||
|||                                    Routes                                     |||
||+------------------------------------------+------------------------------------+||
|||  DestinationCidrBlock                    |  10.0.0.0/16                       |||
|||  GatewayId                               |  local                             |||
|||  Origin                                  |  CreateRouteTable                  |||
|||  State                                   |  active                            |||
||+------------------------------------------+------------------------------------+||
|||                                     Tags                                      |||
||+-------------------------------+-----------------------------------------------+||
|||              Key              |                     Value                     |||
||+-------------------------------+-----------------------------------------------+||
|||  Name                         |  hashiconf-demo-Private-2-us-east-1c-rtb      |||
|||  hashiconf-demo               |  hashiconf-demo-Private-2-us-east-1c-rtb      |||
|||  Aviatrix-Created-Resource    |  Do-Not-Delete-Aviatrix-Created-Resource      |||
||+-------------------------------+-----------------------------------------------+||
||                                   RouteTables                                   ||
|+------------------------------+--------------------------------------------------+|
||  OwnerId                     |  123456789                                    ||
||  RouteTableId                |  rtb-04b09efcce150c0cb                           ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                           ||
|+------------------------------+--------------------------------------------------+|
|||                                 Associations                                  |||
||+------------------------------------+------------------------------------------+||
|||  Main                              |  False                                   |||
|||  RouteTableAssociationId           |  rtbassoc-0c34b560d438d56d5              |||
|||  RouteTableId                      |  rtb-04b09efcce150c0cb                   |||
|||  SubnetId                          |  subnet-048568a00dc534960                |||
||+------------------------------------+------------------------------------------+||
||||                              AssociationState                               ||||
|||+-----------------------------+-----------------------------------------------+|||
||||  State                      |  associated                                   ||||
|||+-----------------------------+-----------------------------------------------+|||
|||                                    Routes                                     |||
||+----------------------+-------------------------+--------------------+---------+||
||| DestinationCidrBlock |        GatewayId        |      Origin        |  State  |||
||+----------------------+-------------------------+--------------------+---------+||
|||  10.0.0.0/16         |  local                  |  CreateRouteTable  |  active |||
|||  0.0.0.0/0           |  igw-0c4827d61bc7255ce  |  CreateRoute       |  active |||
||+----------------------+-------------------------+--------------------+---------+||
|||                                     Tags                                      |||
||+-------------------------------+-----------------------------------------------+||
|||              Key              |                     Value                     |||
||+-------------------------------+-----------------------------------------------+||
|||  Name                         |  hashiconf-demo-Public-0-us-east-1a-rtb       |||
|||  Aviatrix-Created-Resource    |  Do-Not-Delete-Aviatrix-Created-Resource      |||
|||  hashiconf-demo               |  hashiconf-demo-Public-0-us-east-1a-rtb       |||
||+-------------------------------+-----------------------------------------------+||
||                                   RouteTables                                   ||
|+------------------------------+--------------------------------------------------+|
||  OwnerId                     |  123456789                                    ||
||  RouteTableId                |  rtb-0febc1415267c89cc                           ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                           ||
|+------------------------------+--------------------------------------------------+|
|||                                 Associations                                  |||
||+------------------------------------+------------------------------------------+||
|||  Main                              |  False                                   |||
|||  RouteTableAssociationId           |  rtbassoc-0ba50d61d7473479a              |||
|||  RouteTableId                      |  rtb-0febc1415267c89cc                   |||
|||  SubnetId                          |  subnet-0ea74dbaafa376f86                |||
||+------------------------------------+------------------------------------------+||
||||                              AssociationState                               ||||
|||+-----------------------------+-----------------------------------------------+|||
||||  State                      |  associated                                   ||||
|||+-----------------------------+-----------------------------------------------+|||
|||                                    Routes                                     |||
||+----------------------+-------------------------+--------------------+---------+||
||| DestinationCidrBlock |        GatewayId        |      Origin        |  State  |||
||+----------------------+-------------------------+--------------------+---------+||
|||  10.0.0.0/16         |  local                  |  CreateRouteTable  |  active |||
|||  0.0.0.0/0           |  igw-0c4827d61bc7255ce  |  CreateRoute       |  active |||
||+----------------------+-------------------------+--------------------+---------+||
|||                                     Tags                                      |||
||+-------------------------------+-----------------------------------------------+||
|||              Key              |                     Value                     |||
||+-------------------------------+-----------------------------------------------+||
|||  Name                         |  hashiconf-demo-Public-1-us-east-1b-rtb       |||
|||  Aviatrix-Created-Resource    |  Do-Not-Delete-Aviatrix-Created-Resource      |||
|||  hashiconf-demo               |  hashiconf-demo-Public-1-us-east-1b-rtb       |||
||+-------------------------------+-----------------------------------------------+||
||                                   RouteTables                                   ||
|+------------------------------+--------------------------------------------------+|
||  OwnerId                     |  123456789                                    ||
||  RouteTableId                |  rtb-07d557992f80f9658                           ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                           ||
|+------------------------------+--------------------------------------------------+|
|||                                 Associations                                  |||
||+------------------------------------+------------------------------------------+||
|||  Main                              |  False                                   |||
|||  RouteTableAssociationId           |  rtbassoc-04a17315f05b3f709              |||
|||  RouteTableId                      |  rtb-07d557992f80f9658                   |||
|||  SubnetId                          |  subnet-0451f2bdb5aa33dd3                |||
||+------------------------------------+------------------------------------------+||
||||                              AssociationState                               ||||
|||+-----------------------------+-----------------------------------------------+|||
||||  State                      |  associated                                   ||||
|||+-----------------------------+-----------------------------------------------+|||
|||                                    Routes                                     |||
||+----------------------+-------------------------+--------------------+---------+||
||| DestinationCidrBlock |        GatewayId        |      Origin        |  State  |||
||+----------------------+-------------------------+--------------------+---------+||
|||  10.0.0.0/16         |  local                  |  CreateRouteTable  |  active |||
|||  0.0.0.0/0           |  igw-0c4827d61bc7255ce  |  CreateRoute       |  active |||
||+----------------------+-------------------------+--------------------+---------+||
|||                                     Tags                                      |||
||+-------------------------------+-----------------------------------------------+||
|||              Key              |                     Value                     |||
||+-------------------------------+-----------------------------------------------+||
|||  Name                         |  hashiconf-demo-Public-4-us-east-1e-rtb       |||
|||  hashiconf-demo               |  hashiconf-demo-Public-4-us-east-1e-rtb       |||
|||  Aviatrix-Created-Resource    |  Do-Not-Delete-Aviatrix-Created-Resource      |||
||+-------------------------------+-----------------------------------------------+||
||                                   RouteTables                                   ||
|+------------------------------+--------------------------------------------------+|
||  OwnerId                     |  123456789                                    ||
||  RouteTableId                |  rtb-08e643eb7d6dc960e                           ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                           ||
|+------------------------------+--------------------------------------------------+|
|||                                 Associations                                  |||
||+------------------------------------+------------------------------------------+||
|||  Main                              |  False                                   |||
|||  RouteTableAssociationId           |  rtbassoc-0b5f0bf678bd404f5              |||
|||  RouteTableId                      |  rtb-08e643eb7d6dc960e                   |||
|||  SubnetId                          |  subnet-0a5a4fcfe58779a16                |||
||+------------------------------------+------------------------------------------+||
||||                              AssociationState                               ||||
|||+-----------------------------+-----------------------------------------------+|||
||||  State                      |  associated                                   ||||
|||+-----------------------------+-----------------------------------------------+|||
|||                                 Associations                                  |||
||+------------------------------------+------------------------------------------+||
|||  Main                              |  True                                    |||
|||  RouteTableAssociationId           |  rtbassoc-007ede59d54b14368              |||
|||  RouteTableId                      |  rtb-08e643eb7d6dc960e                   |||
|||  SubnetId                          |                                          |||
||+------------------------------------+------------------------------------------+||
||||                              AssociationState                               ||||
|||+-----------------------------+-----------------------------------------------+|||
||||  State                      |  associated                                   ||||
|||+-----------------------------+-----------------------------------------------+|||
|||                                    Routes                                     |||
||+------------------------------------------+------------------------------------+||
|||  DestinationCidrBlock                    |  10.0.0.0/16                       |||
|||  GatewayId                               |  local                             |||
|||  Origin                                  |  CreateRouteTable                  |||
|||  State                                   |  active                            |||
||+------------------------------------------+------------------------------------+||
|||                                     Tags                                      |||
||+-------------------------------+-----------------------------------------------+||
|||              Key              |                     Value                     |||
||+-------------------------------+-----------------------------------------------+||
|||  Aviatrix-Created-Resource    |  Do-Not-Delete-Aviatrix-Created-Resource      |||
|||  hashiconf-demo               |  Main                                         |||
|||  Name                         |  hashiconf-demo-Private-0-us-east-1a-rtb      |||
||+-------------------------------+-----------------------------------------------+||
||                                   RouteTables                                   ||
|+------------------------------+--------------------------------------------------+|
||  OwnerId                     |  123456789                                    ||
||  RouteTableId                |  rtb-08cd69f5db65a9271                           ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                           ||
|+------------------------------+--------------------------------------------------+|
|||                                 Associations                                  |||
||+------------------------------------+------------------------------------------+||
|||  Main                              |  False                                   |||
|||  RouteTableAssociationId           |  rtbassoc-0dadbcfa16908b028              |||
|||  RouteTableId                      |  rtb-08cd69f5db65a9271                   |||
|||  SubnetId                          |  subnet-0bc5180c9b48dc393                |||
||+------------------------------------+------------------------------------------+||
||||                              AssociationState                               ||||
|||+-----------------------------+-----------------------------------------------+|||
||||  State                      |  associated                                   ||||
|||+-----------------------------+-----------------------------------------------+|||
|||                                    Routes                                     |||
||+----------------------+-------------------------+--------------------+---------+||
||| DestinationCidrBlock |        GatewayId        |      Origin        |  State  |||
||+----------------------+-------------------------+--------------------+---------+||
|||  10.0.0.0/16         |  local                  |  CreateRouteTable  |  active |||
|||  0.0.0.0/0           |  igw-0c4827d61bc7255ce  |  CreateRoute       |  active |||
||+----------------------+-------------------------+--------------------+---------+||
||                                   RouteTables                                   ||
|+------------------------------+--------------------------------------------------+|
||  OwnerId                     |  123456789                                    ||
||  RouteTableId                |  rtb-0bfc04e14d968b9b3                           ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                           ||
|+------------------------------+--------------------------------------------------+|
|||                                 Associations                                  |||
||+------------------------------------+------------------------------------------+||
|||  Main                              |  False                                   |||
|||  RouteTableAssociationId           |  rtbassoc-054e9722f2aa514e3              |||
|||  RouteTableId                      |  rtb-0bfc04e14d968b9b3                   |||
|||  SubnetId                          |  subnet-04f5b2b6442b1c402                |||
||+------------------------------------+------------------------------------------+||
||||                              AssociationState                               ||||
|||+-----------------------------+-----------------------------------------------+|||
||||  State                      |  associated                                   ||||
|||+-----------------------------+-----------------------------------------------+|||
|||                                    Routes                                     |||
||+----------------------+-------------------------+--------------------+---------+||
||| DestinationCidrBlock |        GatewayId        |      Origin        |  State  |||
||+----------------------+-------------------------+--------------------+---------+||
|||  10.0.0.0/16         |  local                  |  CreateRouteTable  |  active |||
|||  0.0.0.0/0           |  igw-0c4827d61bc7255ce  |  CreateRoute       |  active |||
||+----------------------+-------------------------+--------------------+---------+||
|||                                     Tags                                      |||
||+-------------------------------+-----------------------------------------------+||
|||              Key              |                     Value                     |||
||+-------------------------------+-----------------------------------------------+||
|||  hashiconf-demo               |  hashiconf-demo-Public-5-us-east-1f-rtb       |||
|||  Aviatrix-Created-Resource    |  Do-Not-Delete-Aviatrix-Created-Resource      |||
|||  Name                         |  hashiconf-demo-Public-5-us-east-1f-rtb       |||
||+-------------------------------+-----------------------------------------------+||
||                                   RouteTables                                   ||
|+------------------------------+--------------------------------------------------+|
||  OwnerId                     |  123456789                                    ||
||  RouteTableId                |  rtb-00e0fad4bdd34b349                           ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                           ||
|+------------------------------+--------------------------------------------------+|
|||                                 Associations                                  |||
||+------------------------------------+------------------------------------------+||
|||  Main                              |  False                                   |||
|||  RouteTableAssociationId           |  rtbassoc-06e525e8a5ed093e7              |||
|||  RouteTableId                      |  rtb-00e0fad4bdd34b349                   |||
|||  SubnetId                          |  subnet-0e58632f922d030d6                |||
||+------------------------------------+------------------------------------------+||
||||                              AssociationState                               ||||
|||+-----------------------------+-----------------------------------------------+|||
||||  State                      |  associated                                   ||||
|||+-----------------------------+-----------------------------------------------+|||
|||                                    Routes                                     |||
||+------------------------------------------+------------------------------------+||
|||  DestinationCidrBlock                    |  10.0.0.0/16                       |||
|||  GatewayId                               |  local                             |||
|||  Origin                                  |  CreateRouteTable                  |||
|||  State                                   |  active                            |||
||+------------------------------------------+------------------------------------+||
|||                                     Tags                                      |||
||+-------------------------------+-----------------------------------------------+||
|||              Key              |                     Value                     |||
||+-------------------------------+-----------------------------------------------+||
|||  hashiconf-demo               |  hashiconf-demo-Private-5-us-east-1f-rtb      |||
|||  Aviatrix-Created-Resource    |  Do-Not-Delete-Aviatrix-Created-Resource      |||
|||  Name                         |  hashiconf-demo-Private-5-us-east-1f-rtb      |||
||+-------------------------------+-----------------------------------------------+||
||                                   RouteTables                                   ||
|+------------------------------+--------------------------------------------------+|
||  OwnerId                     |  123456789                                    ||
||  RouteTableId                |  rtb-03236502b167deccd                           ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                           ||
|+------------------------------+--------------------------------------------------+|
|||                                 Associations                                  |||
||+------------------------------------+------------------------------------------+||
|||  Main                              |  False                                   |||
|||  RouteTableAssociationId           |  rtbassoc-0175b7a31332e24bc              |||
|||  RouteTableId                      |  rtb-03236502b167deccd                   |||
|||  SubnetId                          |  subnet-0e02df59e852d7535                |||
||+------------------------------------+------------------------------------------+||
||||                              AssociationState                               ||||
|||+-----------------------------+-----------------------------------------------+|||
||||  State                      |  associated                                   ||||
|||+-----------------------------+-----------------------------------------------+|||
|||                                    Routes                                     |||
||+----------------------+-------------------------+--------------------+---------+||
||| DestinationCidrBlock |        GatewayId        |      Origin        |  State  |||
||+----------------------+-------------------------+--------------------+---------+||
|||  10.0.0.0/16         |  local                  |  CreateRouteTable  |  active |||
|||  0.0.0.0/0           |  igw-0c4827d61bc7255ce  |  CreateRoute       |  active |||
||+----------------------+-------------------------+--------------------+---------+||
|||                                     Tags                                      |||
||+-------------------------------+-----------------------------------------------+||
|||              Key              |                     Value                     |||
||+-------------------------------+-----------------------------------------------+||
|||  Aviatrix-Created-Resource    |  Do-Not-Delete-Aviatrix-Created-Resource      |||
|||  hashiconf-demo               |  hashiconf-demo-Public-2-us-east-1c-rtb       |||
|||  Name                         |  hashiconf-demo-Public-2-us-east-1c-rtb       |||
||+-------------------------------+-----------------------------------------------+||
||                                   RouteTables                                   ||
|+------------------------------+--------------------------------------------------+|
||  OwnerId                     |  123456789                                    ||
||  RouteTableId                |  rtb-084965b511950f5ea                           ||
||  VpcId                       |  vpc-0ad8269a5ef8e3af7                           ||
|+------------------------------+--------------------------------------------------+|
|||                                 Associations                                  |||
||+------------------------------------+------------------------------------------+||
|||  Main                              |  False                                   |||
|||  RouteTableAssociationId           |  rtbassoc-086d5d8837e0e3f5b              |||
|||  RouteTableId                      |  rtb-084965b511950f5ea                   |||
|||  SubnetId                          |  subnet-051582a46ece3ae61                |||
||+------------------------------------+------------------------------------------+||
||||                              AssociationState                               ||||
|||+-----------------------------+-----------------------------------------------+|||
||||  State                      |  associated                                   ||||
|||+-----------------------------+-----------------------------------------------+|||
|||                                    Routes                                     |||
||+------------------------------------------+------------------------------------+||
|||  DestinationCidrBlock                    |  10.0.0.0/16                       |||
|||  GatewayId                               |  local                             |||
|||  Origin                                  |  CreateRouteTable                  |||
|||  State                                   |  active                            |||
||+------------------------------------------+------------------------------------+||
|||                                     Tags                                      |||
||+-------------------------------+-----------------------------------------------+||
|||              Key              |                     Value                     |||
||+-------------------------------+-----------------------------------------------+||
|||  Aviatrix-Created-Resource    |  Do-Not-Delete-Aviatrix-Created-Resource      |||
|||  Name                         |  hashiconf-demo-Private-4-us-east-1e-rtb      |||
|||  hashiconf-demo               |  hashiconf-demo-Private-4-us-east-1e-rtb      |||
||+-------------------------------+-----------------------------------------------+||
```
