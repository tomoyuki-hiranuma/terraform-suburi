# module "web_server" {
#   source        = "./http_server"
#   instance_type = "t2.micro"
# }

# output "public_dns" {
#   value = module.web_server.public_dns
# }

data "aws_iam_policy_document" "allow_describe_regions" {
  statement {
    effect   = "Allow"
    actions  = ["ec2:DescribeRegions"]
    resources = ["*"]
  }
}

module "describe_regions_for_ec2" {
  source     = "./iam_role"
  name       = "ec2-describe-regions-for-ec2"
  identifier = "ec2.amazonaws.com"
  policy     = data.aws_iam_policy_document.allow_describe_regions.json
}