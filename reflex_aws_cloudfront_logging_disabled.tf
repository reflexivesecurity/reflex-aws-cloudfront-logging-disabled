module "reflex_aws_cloudfront_logging_disabled" {
  source           = "git::https://github.com/cloudmitigator/reflex-engine.git//modules/cwe_lambda?ref=v0.5.4"
  rule_name        = "CloudfrontLoggingDisabled"
  rule_description = "A reflex rule to detect when CloudFront logging is disabled."

  event_pattern = <<PATTERN
{
  "source": [
    "aws.cloudfront"
  ],
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "detail": {
    "eventSource": [
      "cloudfront.amazonaws.com"
    ],
    "eventName": [
      "UpdateDistribution"
    ],
    "responseElements": {
      "distribution":{
        "distributionConfig": {
          "logging": {
              "enabled": [
                false
              ]
          }
        }
      }
    }
  }
}
PATTERN

  function_name   = "CloudfrontLoggingDisabled"
  source_code_dir = "${path.module}/source"
  handler         = "reflex_aws_cloudfront_logging_disabled.lambda_handler"
  lambda_runtime  = "python3.7"
  environment_variable_map = {
    SNS_TOPIC = var.sns_topic_arn,
  }



  queue_name    = "CloudfrontLoggingDisabled"
  delay_seconds = 0

  target_id = "CloudfrontLoggingDisabled"

  sns_topic_arn  = var.sns_topic_arn
  sqs_kms_key_id = var.reflex_kms_key_id
}
