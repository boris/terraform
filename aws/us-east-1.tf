provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region  = "us-east-1"
}

resource "aws_instance" "terraform-demo" {
    count = 0
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

resource "aws_instance" "public-instance" {
    ami = "${var.ubuntu1604}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.staging-public.id}"
    key_name = "boris-aws"
    tags = {
        Name = "public-instance-${count.index}"
    }
vpc_security_group_ids = [
    "${aws_security_group.admin-security-group.id}",
    "${aws_security_group.allow-http.id}"
]
}
