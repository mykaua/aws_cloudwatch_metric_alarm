#
# Provider Configuration

provider "aws" {
  region = "${var.aws-region}"
  profile = "${var.aws-profile}"
}

# provider "random" {
#   version = "~> 2.1"
# }
