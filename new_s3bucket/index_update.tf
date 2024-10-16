# 수정된 index.html 파일을 S3에 다시 업로드
resource "aws_s3_object" "updated_index_html" {
  bucket        = aws_s3_bucket.bucket2.id  # S3 버킷 이름
  key           = "index.html"              # 업로드할 파일 이름
  source        = "index.html"              # 수정된 로컬 index.html 파일 경로
  content_type  = "text/html"
}
