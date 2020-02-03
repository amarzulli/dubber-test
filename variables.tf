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