resource "aws_cloudwatch_metric_alarm" "main" {
  count = "${length(var.cloudwatch)}"
  alarm_name                = "${var.cloudwatch[count.index].alarm_name}"
  comparison_operator       = "${var.cloudwatch[count.index].comparison_operator}"
  evaluation_periods        = "${var.cloudwatch[count.index].evaluation_periods}"
#  metric_name               = "${var.cloudwatch[count.index].metric_name}"
#  namespace                 = "${var.cloudwatch[count.index].namespace}"
#  period                    = "${var.cloudwatch[count.index].period}"
#  statistic                 = "${var.cloudwatch[count.index].statistic}"
  threshold                 = "${var.cloudwatch[count.index].threshold}"
  alarm_description         = "${var.cloudwatch[count.index].alarm_description}"
#  alarm_actions             = "${var.cloudwatch[count.index].alarm_actions}"
  insufficient_data_actions = "${var.cloudwatch[count.index].insufficient_data_actions}"


  dynamic "metric_query" {
    for_each = "${var.cloudwatch[count.index].metric_query}"
    content {
    id = metric_query.value["id"]
    expression = metric_query.value["expression"]
    label = metric_query.value["label"]
    return_data = metric_query.value["return_data"]
  }
  }

  dynamic "metric_query" {
    for_each = "${var.cloudwatch[count.index].metric}"
    content {
    id = metric_query.value["id"]
    metric {
      metric_name = metric_query.value["metric_name"]
      namespace = metric_query.value["namespace"]
      period = metric_query.value["period"]
      stat = metric_query.value["stat"]
      unit = metric_query.value["unit"]
      dimensions = metric_query.value["dimensions"]
    }
  }
  }
}
