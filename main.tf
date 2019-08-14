# RDS Terraform module

module "cloudwatch" {
  source = "./modules/cloudwatch"
  cloudwatch = "${var.cloudwatch_metric_alarm}"
}
