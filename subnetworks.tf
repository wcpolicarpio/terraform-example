
resource "aws_vpc" "environment-example-two" {
  cidr_block = "172.16.100.0/24"
  enable_dns_hostnames = true
  enable_dns_support =  true
  tags {
    Name = "terraform-aws-vpc-example-two"
  }

}

resource "aws_subnet" "subnet1" {
  cidr_block = "${cidrsubnet(aws_vpc.environment-example-two.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.environment-example-two.id}"
  availability_zone = "ca-central-1a"
}


resource "aws_security_group" "subnetsecurity" {
  vpc_id = "${aws_vpc.environment-example-two.id}"

  ingress {
    cidr_blocks = [
      "${aws_vpc.environment-example-two.cidr_block}"
    ]

    from_port = 8080
    protocol = "tcp"
    to_port = 8080
  }
}