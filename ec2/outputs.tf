###___    _   _   _____   ____    _   _   _____
##/ _ \  | | | | |_   _| |  _ \  | | | | |_   _|
#| | | | | | | |   | |   | |_) | | | | |   | |
#| |_| | | |_| |   | |   |  __/  | |_| |   | |
##\___/   \___/    |_|   |_|      \___/    |_|

#Public IP
output "live-output-loadbalancer" {
  value = [
    "${join("-", aws_instance.live-ec2-loadbalancer-a.*.public_ip)}",
    "${join("-", aws_instance.live-ec2-loadbalancer-b.*.public_ip)}",
    "${join("-", aws_instance.live-ec2-loadbalancer-c.*.public_ip)}",
  ]
}
