cloudwatch_metric_alarm = [
{
  alarm_name = "terraform-test-foobar"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  threshold = "10"
  alarm_description = "Request error rate has exceeded 10%"
  insufficient_data_actions = []
  metric_query = [
    {
      id          = "e1"
      expression  = "m2/m1*100"
      label       = "Error Rate"
      return_data = "true"
    },
  ]
  metric = [
    {
      id          = "m2"
      metric_name = "HTTPCode_ELB_5XX_Count"
      namespace   = "AWS/ApplicationELB"
      period      = "120"
      stat        = "Sum"
      unit        = "Count"
      dimensions = {
        LoadBalancer = "app/web"
      }
    },
    {
      id          = "m1"
      metric_name = "RequestCount"
      namespace   = "AWS/ApplicationELB"
      period      = "120"
      stat        = "Sum"
      unit        = "Count"
      dimensions = {
        LoadBalancer = "app/web"
      }
    },
  ]
},

# second cloudwatch
{
  alarm_name = "terraform-test2-foobar2"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  threshold = "10"
  alarm_description = "Request error rate has exceeded 10%"
  insufficient_data_actions = []
  metric_query = [
    {
      id          = "s1"
      expression  = "m2*100"
      label       = "Error Rate"
      return_data = "true"
    },
  ]
  metric = [
    {
      id          = "m2"
      metric_name = "HTTPCode_ELB_5XX_Count_24334"
      namespace   = "AWS/ApplicationELB"
      period      = "120"
      stat        = "Sum"
      unit        = "Count"
      dimensions = {
        LoadBalancer = "app/web"
      }
    },
  ]
},
# third cloudwatch
{
  alarm_name = "terraform-test3-foobar3"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  threshold = "10"
  alarm_description = "Request error rate has exceeded 10%"
  insufficient_data_actions = []
  metric_query = [
    {
      id          = "g2"
      expression  = "s2*100"
      label       = "Error Rate"
      return_data = "true"
    },
   ]
  metric = [
    {
      id          = "s2"
      metric_name = "RequestCount_HTTPCode_ELB_5XX_Count"
      namespace   = "AWS/ApplicationELB"
      period      = "120"
      stat        = "Sum"
      unit        = "Count"
      dimensions = {
        LoadBalancer = "app/web"
      }
    },
  ]
},
]
