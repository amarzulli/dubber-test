variable ibm_region {
    description = "IBM Cloud region where all resources will be deployed"
    default     = "au-syd"
}

##############################################################################
# Network variables
##############################################################################

variable "cidr_blocks" {
    description = "List of CIDR blocks for the subnets"
    default     = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
    type        = "list"  
}

##############################################################################
# Cluster Variables
##############################################################################


variable machine_type {
  description = "Machine type for the IKS Cluster"
  default     = "b2.2x8"
}


variable "worker_count" {
  description = "Number of workers per zone"
  default     = 1
}

##############################################################################