resource "aws_key_pair" "jenkins" {
  key_name   = "jenkins"
  public_key = file("jenkins.pub")
}