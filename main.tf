data "archive_file" "zip_the_python_code" {
type        = "zip"
source_file  = "welcome.py"
output_path = "outputs/welcome.zip"
}
 
resource "aws_lambda_function" "terraform_lambda_func" {
filename                       = "outputs/welcome.zip"
function_name                  = "welcome"
role                           = aws_iam_role.lambda_role.arn
handler                        = "welcome.hello"
runtime                        = "python3.8"
depends_on                     = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}
