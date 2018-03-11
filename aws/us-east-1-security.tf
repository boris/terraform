# Allow HTTP
resource "aws_security_group" "allow-http" {
    name = "allow-http"
    description = "allow http access from 0/0"
    vpc_id = "${aws_vpc.Staging.id}"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# Admin SG
resource "aws_security_group" "admin-security-group" {
    name = "admin-security-group"
    description = "default SG for admins"
    vpc_id = "${aws_vpc.Staging.id}"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [
    	"200.104.143.93/32",
    	"45.55.21.238/32"
        ]
    }
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = [
        	"200.104.143.93/32",
    	"45.55.21.238/32"
        ]
    }
}
