##############################################################################
# Create a VPC
##############################################################################

resource ibm_is_vpc vpc {
  name           = "schematics-vpc"
}

##############################################################################
# Prefixes and subnets for zone 1
##############################################################################

resource ibm_is_vpc_address_prefix subnet_prefix {
  count = "3"

  name  = "schematics-vpc-prefix-zone-${count.index + 1}"
  zone  = "${var.ibm_region}-${(count.index % 3) + 1}"
  vpc   = "${ibm_is_vpc.vpc.id}"
  cidr  = "${element(var.cidr_blocks, count.index)}"
}

##############################################################################
# Create Subnets
##############################################################################

resource ibm_is_subnet subnet {
  count           = "3"

  name            = "schematics-vpc-subnet-${count.index + 1}"
  vpc             = "${ibm_is_vpc.vpc.id}"
  zone            = "${var.ibm_region}-${count.index + 1}"
  ipv4_cidr_block = "${element(ibm_is_vpc_address_prefix.subnet_prefix.*.cidr, count.index)}" 
}

##############################################################################
# Create IKS on VPC Cluster
##############################################################################

resource ibm_container_vpc_cluster cluster {

  name               = "schematics-iks"
  vpc_id             = "${ibm_is_vpc.vpc.id}"
  flavor             = "${var.machine_type}"
  worker_count       = "${var.worker_count}"
  

  zones = [
    {
      subnet_id = "${ibm_is_subnet.subnet1.id}"
      name      = "${var.ibm_region}-1"
    },
    {
      subnet_id = "${ibm_is_subnet.subnet2.id}"
      name      = "${var.ibm_region}-2"
    },
    {
      subnet_id = "${ibm_is_subnet.subnet3.id}"
      name      = "${var.ibm_region}-3"
    }
  ]
}

##############################################################################