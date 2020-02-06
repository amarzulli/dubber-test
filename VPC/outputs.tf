##############################################################################
# VPC GUID
##############################################################################

output vpc_id {
  description = "ID of VPC created"
  value       = "${ibm_is_vpc.vpc.id}"
}

##############################################################################

##############################################################################
# Workspace ID
##############################################################################

output vpc_workspace_id {
  description = "Schematics Workspace of VPC created"
  value       = "${terraform.workspace.id}"
}


##############################################################################
# List of subnet IDs
##############################################################################

output subnet_1_id {
  description = "First Subnet"
  value       = "${element(ibm_is_subnet.subnet.*.id, 0)}"
}

output subnet_2_id {
  description = "Second Subnet"
  value       = "${element(ibm_is_subnet.subnet.*.id, 1)}"
}

output subnet_3_id {
  description = "Third Subnet"
  value       = "${element(ibm_is_subnet.subnet.*.id, 2)}"
}

##############################################################################
