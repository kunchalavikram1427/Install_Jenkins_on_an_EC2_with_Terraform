# Launch master node
resource "aws_instance" "jenkins" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = "jenkins-master-service"
  }
  key_name        = aws_key_pair.jenkins_service.key_name
  security_groups = ["jenkins_service_sg"]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("jenkins")
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "./install-jenkins.sh"
    destination = "/home/ec2-user/install-jenkins.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ec2-user/install-jenkins.sh",
      "sudo sh /home/ec2-user/install-jenkins.sh"
    ]
  }
}