resource "aws_vpc" "Staging" {
    cidr_block = "10.240.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
	Name = "Staging"
    }
}

resource "aws_subnet" "staging-public" {
    vpc_id = "${aws_vpc.Staging.id}"
    cidr_block = "10.240.10.0/24"
    availability_zone = "us-east-1a"
    tags {
	Name = "staging-public"
    }
}

resource "aws_subnet" "stsaging-private" {
    vpc_id = "${aws_vpc.Staging.id}"
    cidr_block = "10.240.20.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name = "staging-private"
    }
}
