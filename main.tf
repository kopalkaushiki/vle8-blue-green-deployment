provider "aws" {
  region = "us-east-1"
}

data "aws_instance" "jenkins" {
  instance_id = "i-0c3e76922e5f58801"
}

output "instance_id" {
  value = data.aws_instance.jenkins.id
}

output "public_ip" {
  value = data.aws_instance.jenkins.public_ip
}
