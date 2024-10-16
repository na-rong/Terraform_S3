# ce31-bucket2에 새로운 index.html 파일 업로드
resource "aws_s3_object" "index_html" {
  bucket        = aws_s3_bucket.bucket2.id
  key           = "index.html"
  source        = "index.html"
  content_type  = "text/html"
}

# S3 버킷의 퍼블릭 읽기 정책 설정
resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.bucket2.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [ "s3:GetObject" ],
      "Resource": [
        "arn:aws:s3:::ce31-bucket2",
        "arn:aws:s3:::ce31-bucket2/*"
      ]
    }
  ]
}
EOF
}
