variable "aws-region" {
  type        = "string"
  description = "The AWS Region to deploy EKS"
}

variable "aws-profile" {
  type    = "string"
}

variable "cloudwatch_metric_alarm" {
  type = list(object({
    alarm_name = string
    comparison_operator = string
    evaluation_periods = string
#    metric_name = string
#    namespace = string
#    period = string
#    statistic = string
    threshold = string
    alarm_description = string
#    alarm_actions = list(string)
    insufficient_data_actions = list(string)
    metric_query = list(object({
      id = string
      expression = string
      label = string
      return_data = string
      }))
    metric = list(object({
      id = string
      metric_name = string
      namespace = string
      period = string
      stat = string
      unit = string
      dimensions = map(string)
      }))
    }))
  default = []
}
