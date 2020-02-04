##############################################################################
# Account Variables
##############################################################################

variable ibm_region {
    description = "IBM Cloud region where all resources will be deployed"
    default     = "au-syd"
}

variable resource_group {
    description = "Name of resource group to provision resources"
    default     = "schematics-test"
}

variable unique_id {
    description = "The IBM Cloud platform API key needed to deploy IAM enabled resources"
    default    = "andrew"
}

##############################################################################


##############################################################################
# Network variables
##############################################################################

variable "cidr_blocks" {
    description = "List of CIDR blocks for the subnets"
    default     = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
    type        = "list"  
}

##############################################################################
