# S3 버킷 생성
resource "aws_s3_bucket" "bucket2" {
  bucket = "ce31-bucket2"
}

# 퍼블릭 접근 제어 설정 해제
resource "aws_s3_bucket_public_access_block" "bucket2_public_access_block" {
  bucket = aws_s3_bucket.bucket2.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# S3 웹사이트 호스팅 설정
resource "aws_s3_bucket_website_configuration" "bucket_website" {
  bucket = aws_s3_bucket.bucket2.id

  index_document {
    suffix = "index.html"  # 기본 문서를 index.html로 설정
  }
}
