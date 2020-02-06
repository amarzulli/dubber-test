##############################################################################
# Create IKS on VPC Cluster
##############################################################################

resource ibm_container_vpc_cluster cluster {

  name               = "${var.cluster_name}"
  vpc_id             = "${data.ibm_schematics_output.vpc.output_values["vpc_id"]}"
  flavor             = "${var.machine_type}"
  worker_count       = "${var.worker_count}"
  resource_group_id  = "${data.ibm_resource_group.resource_group.id}"

  zones = [
    {
      subnet_id = "${data.ibm_schematics_output.vpc.output_values["subnet_1_id"]}"
      name      = "${var.ibm_region}-1"
    },
    {
      subnet_id = "${data.ibm_schematics_output.vpc.output_values["subnet_2_id"]}"
      name      = "${var.ibm_region}-2"
    },
    {
      subnet_id = "${data.ibm_schematics_output.vpc.output_values["subnet_3_id"]}"
      name      = "${var.ibm_region}-3"
    }
  ]
}

##############################################################################
