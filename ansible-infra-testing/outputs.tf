output "named_instance_public_ips" {
  description = "Map of instance names to public IPs"
  value = {
    for i in range(length(var.ansible_instances)) :
    var.ansible_instances[i] => aws_instance.ansible_servers[i].public_ip
  }
}

