# 새로운 main.html 파일을 S3에 업로드
resource "aws_s3_object" "main_html" {
  bucket        = aws_s3_bucket.bucket2.id  # S3 버킷 이름 지정
  key           = "main.html"               # S3에 업로드할 파일 이름
  source        = "main.html"               # 로컬 경로에서 main.html 파일 지정
  content_type  = "text/html"               # 파일 타입 설정
}
