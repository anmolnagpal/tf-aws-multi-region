variable "ec2-variable" {
  type = "map"

  default = {
    #EC2-AZ-A
    a_instance_count = 1

    #EC2-AZ-B
    b_instance_count = 1

    #No of server's
    instance_type = "t2.small"

    # Instance type
    volume_type               = "gp2"
    volume_size               = "20"
    delete_on_termination     = true
    ebs_delete_on_termination = false
    ebs_device_name           = "/dev/sdg"
  }
}

variable "public-ip" {
  default = "0.0.0.0/0"
}

variable "ami" {
  type = "map"

  default = {
    ubunut16 = ""
    ubuntu18 = ""
  }
}
