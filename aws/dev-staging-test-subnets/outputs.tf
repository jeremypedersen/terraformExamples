#
# Output the information required to test the
# environment created in main.tf
#
# - Username for bastion host (same for all instances)
# - SSH key name for login (to the management instance)
# - Password for login (to the dev, staging, and prod instances)
# - Public IP address for bastion host
#
# We also output the private IP addresses for each instance:
#
# - Private IP for development instance
# - Private IP for staging instance
# - Private IP for production instance
# - Private IP for management instance
#
# Testing the environment:
# 
# - Log in to the bastion host. From there, use SSH to log into
# any of (dev, staging, prod) and use ping to confirm security group
# rules are restricting traffic flow like so:
# 
# development -> staging -> production

output "username" {
  description = "Username for instance login (all instances)"
  value       = "ubuntu"
}

output "public_key_name" {
  description = "Name of public SSH key (DO NOT CHANGE unless you have changed the name of the key generated by ssh-keygen in setup.sh)"
  value = "${aws_key_pair.dev-staging-test-ssh-key.key_name}"
}

output "bastion_public_ip" {
  description = "EC2 instance public IP address (for bastion host)"
  value       = "${aws_instance.ec2-bastion.public_ip}"
}

output "bastion_private_ip" {
  description = "EC2 instance private IP address (for bastion host)"
  value       = "${aws_instance.ec2-bastion.private_ip}"
}

# Private IP addresses for the dev, staging, and prod instances
output "dev_private_ip" {
  description = "Private IP address of dev instance"
  value = "${aws_instance.ec2-dev.private_ip}"
}

output "staging_private_ip" {
  description = "Private IP address of staging instance"
  value = "${aws_instance.ec2-staging.private_ip}"

}

output "production_private_ip" {
  description = "Private IP address of dev instance"
  value = "${aws_instance.ec2-prod.private_ip}"

}