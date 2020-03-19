# reflex-aws-cloudfront-logging-disabled
TODO: Write a brief description of your rule and what it does.

## Usage
To use this rule either add it to your `reflex.yaml` configuration file:  
```
rules:
  - reflex-aws-cloudfront-logging-disabled:
      version: latest
```

or add it directly to your Terraform:  
```
...

module "reflex-aws-cloudfront-logging-disabled" {
  source           = "github.com/cloudmitigator/reflex-aws-cloudfront-logging-disabled"
}

...
```

## License
This Reflex rule is made available under the MPL 2.0 license. For more information view the [LICENSE](https://github.com/cloudmitigator/reflex-aws-cloudfront-logging-disabled/blob/master/LICENSE) 