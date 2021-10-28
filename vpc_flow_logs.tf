resource "aws_cloudwatch_log_group" "SDWAN_Lab_VPCs_Logs" {
  provider      = aws.virginia
  name          = "${var.username}_vpc_flow_logs_group"

  tags = {
    Owner = "${var.username}"
    Enviroment = "SD-WAN Lab"
  }
}


resource "aws_iam_role" "SDWAN_Lab_IAM_Role" {
  provider               = aws.virginia
  name = "${var.username}_vpc_flow_logs_to_cloudWatch_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "SD-WAN_Lab_VPCFlow_Log_Policy" {
  provider               = aws.virginia
  name = "${var.username}_vpc_flow_logs_iam_policy"
  role = aws_iam_role.SDWAN_Lab_IAM_Role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

# Activate VPC Flow Logs on Hub 1 VPC 

resource "aws_flow_log" "Hub1_vpc" {
  provider        = aws.virginia
  iam_role_arn    = aws_iam_role.SDWAN_Lab_IAM_Role.arn
  log_destination = aws_cloudwatch_log_group.SDWAN_Lab_VPCs_Logs.arn
  traffic_type    = "ALL"
  vpc_id          = module.Hub_1_Prod_VPC.SDWAN_VPC
}

# Activate VPC Flow Logs on Spoke 1

resource "aws_flow_log" "Spoke1_vpc" {
  provider        = aws.virginia
  iam_role_arn    = aws_iam_role.SDWAN_Lab_IAM_Role.arn
  log_destination = aws_cloudwatch_log_group.SDWAN_Lab_VPCs_Logs.arn
  traffic_type    = "ALL"
  vpc_id          = module.Spoke_1_Prod_VPC.SDWAN_VPC
}
