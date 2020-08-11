module "sqs_lambda" {
  source                    = "git::https://github.com/cloudmitigator/reflex-engine.git//modules/sqs_lambda?ref=v2.0.0"
  cloudwatch_event_rule_id  = var.cloudwatch_event_rule_id
  cloudwatch_event_rule_arn = var.cloudwatch_event_rule_arn
  function_name             = "CloudfrontLoggingDisabled"
  package_location          = var.package_location
  handler                   = "reflex_aws_cloudfront_logging_disabled.lambda_handler"
  lambda_runtime            = "python3.7"
  environment_variable_map = {
    SNS_TOPIC = var.sns_topic_arn,
  }



  queue_name    = "CloudfrontLoggingDisabled"
  delay_seconds = 0

  target_id = "CloudfrontLoggingDisabled"

  sns_topic_arn  = var.sns_topic_arn
  sqs_kms_key_id = var.reflex_kms_key_id
}
