""" Module for CloudfrontLoggingDisabled """

import json

from reflex_core import AWSRule


class CloudfrontLoggingDisabled(AWSRule):
    """ Check if CloudFront logging is disabled """

    def __init__(self, event):
        super().__init__(event)

    def extract_event_data(self, event):
        """ Extract required event data """
        self.distribution_id = event["detail"]["responseElements"]["distribution"]["id"]
        self.logging_enabled = event["detail"]["responseElements"]["distribution"]["distributionConfig"]["logging"]["enabled"]

    def resource_compliant(self):
        """
        Determine if the resource is compliant with your rule.

        Return True if it is compliant, and False if it is not.
        """
        return self.logging_enabled

    def get_remediation_message(self):
        """ Returns a message about the remediation action that occurred """
        return f"Logging is disabled for Cloudfront distribution {self.distribution_id}"


def lambda_handler(event, _):
    """ Handles the incoming event """
    rule = CloudfrontLoggingDisabled(json.loads(event["Records"][0]["body"]))
    rule.run_compliance_rule()
