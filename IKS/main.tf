#############################################################################
# Resource Group
##############################################################################

data ibm_resource_group resource_group {
  name = "${var.resource_group}"
}

##############################################################################


##############################################################################
# Schematics outputs from VPC Workspace
##############################################################################

data ibm_schematics_workspace vpc {
  workspace_id = "${var.vpc_workspace_id}"
}

data ibm_schematics_output vpc {
  workspace_id = "${var.vpc_workspace_id}"
  template_id  = "${element(data.ibm_schematics_workspace.vpc.template_id, 0)}"
}

##############################################################################
