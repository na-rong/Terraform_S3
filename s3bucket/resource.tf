#s3 버킷 생성 + index.html 업로드

# S3 버킷 생성
resource "aws_s3_bucket" "bucket1" {
  bucket = "ce31-bucket1"  # 생성하고자 하는 S3 버킷 이름
}

# S3 버킷의 public access block 설정
resource "aws_s3_bucket_public_access_block" "bucket1_public_access_block" {
  bucket = aws_s3_bucket.bucket1.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# 이미 존재하는 S3 버킷에 index.html 파일을 업로드
resource "aws_s3_object" "index" {
  bucket        = aws_s3_bucket.bucket1.id  # 생성된 S3 버킷 이름 사용
  key           = "index.html"
  source        = "index.html"
  content_type  = "text/html"
}
# 이미 존재하는 S3 버킷에 main.html 파일 업로드
resource "aws_s3_object" "main_html" {
  bucket        = aws_s3_bucket.bucket1.id  # 이미 생성된 S3 버킷
  key           = "main.html"               # 업로드할 파일 이름
  source        = "main.html"               # 로컬의 main.html 파일 경로
  content_type  = "text/html"
}

# 수정된 index.html 파일을 다시 S3에 업로드
resource "aws_s3_object" "index_html_update" {
  bucket        = aws_s3_bucket.bucket1.id  # 이미 생성된 S3 버킷
  key           = "index.html"              # 업로드할 파일 이름
  source        = "index.html"              # 수정된 로컬 파일 경로
  content_type  = "text/html"
}


# S3 버킷의 웹사이트 호스팅 설정
resource "aws_s3_bucket_website_configuration" "xweb_bucket_website" {
  bucket = aws_s3_bucket.bucket1.id  # 생성된 S3 버킷 이름 사용

  index_document {
    suffix = "index.html"
  }
}



# S3 버킷의 public read 정책 설정
resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.bucket1.id  # 생성된 S3 버킷 이름 사용

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [ "s3:GetObject" ],
      "Resource": [
        "arn:aws:s3:::ce31-bucket1",
        "arn:aws:s3:::ce31-bucket1/*"
      ]
    }
  ]
}
EOF
}
