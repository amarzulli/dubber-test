##############################################################################
# Create a VPC
##############################################################################

resource ibm_is_vpc vpc {
  name           = "schematics-vpc"
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
