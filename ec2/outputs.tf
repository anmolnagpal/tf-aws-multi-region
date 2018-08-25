###___    _   _   _____   ____    _   _   _____
##/ _ \  | | | | |_   _| |  _ \  | | | | |_   _|
#| | | | | | | |   | |   | |_) | | | | |   | |
#| |_| | | |_| |   | |   |  __/  | |_| |   | |
##\___/   \___/    |_|   |_|      \___/    |_|

#Public IP
output "output" {
  value = [
    "${join("-", aws_instance.ec2-a.*.public_ip)}",
    "${join("-", aws_instance.ec2-b.*.public_ip)}",
  ]
}
