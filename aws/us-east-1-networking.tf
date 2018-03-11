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

resource "aws_subnet" "staging-private" {
    vpc_id = "${aws_vpc.Staging.id}"
    cidr_block = "10.240.20.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name = "staging-private"
    }
}

resource "aws_internet_gateway" "staging-ig" {
    vpc_id = "${aws_vpc.Staging.id}"
    tags = {
        Name = "staging-ig"
    }
}

resource "aws_default_route_table" "staging-vpc" {
    default_route_table_id = "${aws_vpc.Staging.default_route_table_id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.staging-ig.id}"
    }
    tags = {
        Name = "staging-default-route"
    }
}
