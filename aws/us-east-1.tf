provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region  = "us-east-1"
}

resource "aws_instance" "terraform-demo" {
    count = 2
    ami = "ami-66506c1c"
    instance_type = "t2.micro"
    subnet_id = "subnet-3ecb2174"
    vpc_security_group_ids = [
	"sg-3d13be4b"
    ]
    tags = {
	Name = "terraform-demo-${count.index}"
    }
}
