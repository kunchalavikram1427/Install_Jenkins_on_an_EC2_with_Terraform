resource "aws_key_pair" "jenkins_service" {
  key_name   = "jenkins_service"
  public_key = file("jenkins.pub")
}