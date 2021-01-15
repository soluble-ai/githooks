#!/bin/sh

# Check for hardcoded secrets in the source repository
soluble secrets-scan

soluble dep-scan trivy
#soluble dep-scan retirejs

soluble dep-scan trivy
#soluble dep-scan retirejs

soluble image-scan

soluble auto-scan
#soluble kubernetes-scan
#soluble terraform-scan
