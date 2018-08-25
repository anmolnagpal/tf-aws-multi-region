resource "aws_route53_record" "cdnv4" {
  zone_id        = "${data.aws_route53_zone.default.zone_id}"
  name           = "${format("%s.%s", var.r53_domain_name, data.aws_route53_zone.default.name)}"
  type           = "A"
  ttl            = "60"
  records        = ["${aws_instance.server.*.public_ip}"]
  set_identifier = "cdn-${var.region}-v4"

  latency_routing_policy {
    region = "${var.region}"
  }
}

resource "aws_route53_record" "cdnv6" {
  zone_id        = "${data.aws_route53_zone.default.zone_id}"
  name           = "${format("%s.%s", var.r53_domain_name, data.aws_route53_zone.default.name)}"
  type           = "AAAA"
  ttl            = "60"
  records        = ["${flatten(aws_instance.server.*.ipv6_addresses)}"]
  set_identifier = "cdn-${var.region}-v6"

  latency_routing_policy {
    region = "${var.region}"
  }
}
