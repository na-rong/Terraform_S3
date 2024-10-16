# AWS EC2 인스턴스 생성
resource "aws_instance" "ce31_ec2" {
  ami           = "ami-040c33c6a51fd5d96"  # Amazon Linux 2 AMI (리전마다 다름)
  instance_type = "t2.micro"               # 인스턴스 타입

  tags = {
    Name = "ce31-ec2"                      # 인스턴스 이름 태그
  }

  # 보안 그룹 설정 (필요 시 아래 보안 그룹 리소스를 추가)
  security_groups = ["ce31-ec2-sg"]

  # SSH 접근을 위한 키 페어 설정 (이미 존재하는 경우)
  key_name = "ce31-key"
}

# 보안 그룹 설정 (필요에 따라 설정)
resource "aws_security_group" "ce31_sg" {
  name        = "ce31-ec2-sg"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # SSH 접근 허용 (모든 IP에서 접근 가능, 제한 가능)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # HTTP 접근 허용
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"           # 모든 아웃바운드 트래픽 허용
    cidr_blocks = ["0.0.0.0/0"]
  }
}
