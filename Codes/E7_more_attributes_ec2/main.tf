provider "aws" {
    region = var.AWS_REGION
}

resource "aws_instance" "ec2_instance" {
    ami = lookup (var.AMI, var.AWS_REGION)
    instance_type = "t2.micro"
    vpc_security_group_ids = [var.SG]
    tags = {machine_name = "HTTP_SERVER"}
    key_name = "vjpaws"
    count = 2
}