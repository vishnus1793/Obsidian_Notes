

> AWS CLI = AWS APIs from a terminal.

Every command follows:

```bash
aws <service> <operation> [parameters]
```

Examples:

```bash
aws s3 ls
aws ec2 describe-instances
aws iam list-users
aws lambda invoke
```

---

# Core Mental Model

Pattern:

```bash
aws SERVICE ACTION
```

Examples:

|Service|Action|
|---|---|
|ec2|describe-instances|
|s3|cp|
|iam|create-user|
|lambda|invoke|
|sts|get-caller-identity|
|cloudformation|deploy|

---

# Installation

Linux:

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip

unzip awscliv2.zip

sudo ./aws/install
```

Verify:

```bash
aws --version
```

---

# Authentication

Configure:

```bash
aws configure
```

Credentials:

```ini
~/.aws/credentials

[default]
aws_access_key_id=XXXXX
aws_secret_access_key=XXXXX
```

Config:

```ini
~/.aws/config

[default]
region=ap-south-1
output=json
```

---

# Profiles

Create:

```bash
aws configure --profile dev
```

Use:

```bash
aws s3 ls --profile dev
```

List:

```bash
aws configure list-profiles
```

Environment variable:

```bash
export AWS_PROFILE=dev
```

Rule:

```text
Never work directly from default in production.
```

---

# Identity Verification

Most important command:

```bash
aws sts get-caller-identity
```

Returns:

```json
{
  "UserId": "...",
  "Account": "...",
  "Arn": "..."
}
```

Always run before production operations.

---

# Regions

List:

```bash
aws ec2 describe-regions
```

Override:

```bash
aws ec2 describe-instances \
  --region us-east-1
```

Environment:

```bash
export AWS_DEFAULT_REGION=us-east-1
```

---

# Output Formats

JSON:

```bash
--output json
```

Table:

```bash
--output table
```

Text:

```bash
--output text
```

---

# JMESPath Queries

Instance IDs:

```bash
aws ec2 describe-instances \
 --query 'Reservations[].Instances[].InstanceId'
```

First item:

```bash
Items[0]
```

Names:

```bash
Users[*].UserName
```

Nested:

```bash
Reservations[].Instances[].State.Name
```

Table projection:

```bash
--query 'Users[*].[UserName,CreateDate]'
```

---

# Auto Prompt

```bash
aws --cli-auto-prompt
```

Or:

```bash
aws s3 cp --cli-auto-prompt
```

Interactive command builder.

---

# Help

Service help:

```bash
aws ec2 help
```

Operation help:

```bash
aws ec2 run-instances help
```

---

# Dry Run

```bash
aws ec2 run-instances --dry-run
```

Useful for permission validation.

---

# Pagination

Disable:

```bash
--no-paginate
```

Limit:

```bash
--max-items 100
```

---

# S3 Essentials

List buckets:

```bash
aws s3 ls
```

List objects:

```bash
aws s3 ls s3://bucket
```

Recursive:

```bash
aws s3 ls s3://bucket --recursive
```

Upload:

```bash
aws s3 cp file.txt s3://bucket/
```

Download:

```bash
aws s3 cp s3://bucket/file.txt .
```

Sync local → S3:

```bash
aws s3 sync ./site s3://bucket
```

Sync with delete:

```bash
aws s3 sync ./site s3://bucket --delete
```

Sync S3 → Local:

```bash
aws s3 sync s3://bucket .
```

Copy bucket → bucket:

```bash
aws s3 cp s3://bucket-a s3://bucket-b --recursive
```

Delete object:

```bash
aws s3 rm s3://bucket/file.txt
```

Delete recursively:

```bash
aws s3 rm s3://bucket --recursive
```

---

# S3 vs S3API

High-level:

```bash
aws s3
```

Low-level:

```bash
aws s3api
```

Example:

```bash
aws s3api get-bucket-versioning
```

Rule:

```text
s3 = convenience
s3api = full API power
```

---

# EC2

List:

```bash
aws ec2 describe-instances
```

Running only:

```bash
aws ec2 describe-instances \
 --filters Name=instance-state-name,Values=running
```

Start:

```bash
aws ec2 start-instances --instance-ids i-123
```

Stop:

```bash
aws ec2 stop-instances --instance-ids i-123
```

Terminate:

```bash
aws ec2 terminate-instances --instance-ids i-123
```

Launch:

```bash
aws ec2 run-instances \
 --image-id ami-xxx \
 --instance-type t3.micro \
 --key-name mykey \
 --security-group-ids sg-xxx \
 --subnet-id subnet-xxx
```

---

# Security Groups

List:

```bash
aws ec2 describe-security-groups
```

Allow SSH:

```bash
aws ec2 authorize-security-group-ingress \
 --group-id sg-123 \
 --protocol tcp \
 --port 22 \
 --cidr 0.0.0.0/0
```

---

# EBS

List volumes:

```bash
aws ec2 describe-volumes
```

Create:

```bash
aws ec2 create-volume
```

Attach:

```bash
aws ec2 attach-volume
```

Snapshot:

```bash
aws ec2 create-snapshot
```

---

# IAM

List users:

```bash
aws iam list-users
```

Create:

```bash
aws iam create-user \
 --user-name john
```

Delete:

```bash
aws iam delete-user \
 --user-name john
```

Policies:

```bash
aws iam list-policies
```

Attach:

```bash
aws iam attach-user-policy
```

Roles:

```bash
aws iam create-role
```

```bash
aws iam attach-role-policy
```

```bash
aws iam list-roles
```

---

# Lambda

List:

```bash
aws lambda list-functions
```

Invoke:

```bash
aws lambda invoke \
 --function-name myfn \
 output.json
```

---

# CloudWatch

Metrics:

```bash
aws cloudwatch list-metrics
```

Alarms:

```bash
aws cloudwatch describe-alarms
```

Logs:

```bash
aws logs describe-log-groups
```

Streams:

```bash
aws logs describe-log-streams
```

Tail logs:

```bash
aws logs tail \
 /aws/lambda/myfn \
 --follow
```

---

# ECS

```bash
aws ecs list-clusters
aws ecs list-services
aws ecs list-tasks
```

---

# EKS

Clusters:

```bash
aws eks list-clusters
```

Configure kubectl:

```bash
aws eks update-kubeconfig \
 --name mycluster
```

---

# RDS

Instances:

```bash
aws rds describe-db-instances
```

Snapshots:

```bash
aws rds describe-db-snapshots
```

Create snapshot:

```bash
aws rds create-db-snapshot
```

---

# DynamoDB

Tables:

```bash
aws dynamodb list-tables
```

Scan:

```bash
aws dynamodb scan \
 --table-name users
```

Get item:

```bash
aws dynamodb get-item
```

Put item:

```bash
aws dynamodb put-item
```

---

# Route53

Hosted zones:

```bash
aws route53 list-hosted-zones
```

Records:

```bash
aws route53 list-resource-record-sets
```

---

# Systems Manager (SSM)

Managed instances:

```bash
aws ssm describe-instance-information
```

Run command:

```bash
aws ssm send-command
```

Session Manager:

```bash
aws ssm start-session \
 --target i-123
```

SSH without SSH.

---

# Secrets Manager

List:

```bash
aws secretsmanager list-secrets
```

Get:

```bash
aws secretsmanager get-secret-value \
 --secret-id mysecret
```

---

# KMS

List keys:

```bash
aws kms list-keys
```

Encrypt:

```bash
aws kms encrypt
```

Decrypt:

```bash
aws kms decrypt
```

---

# CloudFormation

Deploy:

```bash
aws cloudformation deploy
```

Stacks:

```bash
aws cloudformation describe-stacks
```

Events:

```bash
aws cloudformation describe-stack-events
```

Delete:

```bash
aws cloudformation delete-stack
```

---

# Waiters

Wait until running:

```bash
aws ec2 wait instance-running \
 --instance-ids i-123
```

Wait until terminated:

```bash
aws ec2 wait instance-terminated \
 --instance-ids i-123
```

---

# JSON Input Files

Generate skeleton:

```bash
aws ec2 run-instances \
 --generate-cli-skeleton
```

Use input file:

```bash
aws ec2 run-instances \
 --cli-input-json file://input.json
```

---

# Debugging

```bash
aws s3 ls --debug
```

Shows:

- HTTP requests
    
- API responses
    
- SigV4 signing
    
- Retries
    

---

# Exit Codes

```text
0 = success
non-zero = failure
```

Example:

```bash
if aws s3 ls; then
  echo success
fi
```

---

# Bash Automation

Capture instance ID:

```bash
INSTANCE_ID=$(aws ec2 run-instances \
 --query 'Instances[0].InstanceId' \
 --output text)
```

Use later:

```bash
aws ec2 stop-instances \
 --instance-ids "$INSTANCE_ID"
```

---

# Tagging

Create:

```bash
aws ec2 create-tags \
 --resources i-123 \
 --tags Key=Name,Value=prod-api
```

Filter:

```bash
aws ec2 describe-instances \
 --filters Name=tag:Environment,Values=prod
```

---

# Daily Driver Commands

Identity:

```bash
aws sts get-caller-identity
```

Resources:

```bash
aws resourcegroupstaggingapi \
 get-resources
```

Buckets:

```bash
aws s3 ls
```

Running instances:

```bash
aws ec2 describe-instances \
 --filters Name=instance-state-name,Values=running
```

Lambda logs:

```bash
aws logs tail \
 /aws/lambda/myfn \
 --follow
```

---

# Production Rules

Always verify account:

```bash
aws sts get-caller-identity
```

Use profiles:

```bash
--profile prod
```

Use dry run:

```bash
--dry-run
```

Filter outputs:

```bash
--query
```

Use waiters:

```bash
aws ec2 wait
```

Master JMESPath.

---

# Mastery Roadmap

## Level 1

- configure
    
- s3
    
- ec2
    
- iam
    

## Level 2

- profiles
    
- filters
    
- JMESPath
    
- automation
    

## Level 3

- lambda
    
- ssm
    
- kms
    
- cloudformation
    

## Level 4

- waiters
    
- skeletons
    
- jq
    
- cross-account roles
    

## Level 5

Operate AWS primarily from terminal.

Infrastructure first.  
Console second.

---

# The Most Important AWS CLI Command

```bash
aws sts get-caller-identity
```

The costliest AWS mistake is usually not running the wrong command.

It is running the correct command in the wrong AWS account.