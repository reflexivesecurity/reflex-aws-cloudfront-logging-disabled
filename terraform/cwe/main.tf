module "cwe" {
  source      = "git::https://github.com/reflexivesecurity/reflex-engine.git//modules/cwe?ref=v2.1.1"
  name        = "CloudfrontLoggingDisabled"
  description = "A reflex rule to detect when CloudFront logging is disabled."

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
      "UpdateDistribution",
      "CreateDistribution"
    ],
    "responseElements": {
      "distribution": {
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

}
