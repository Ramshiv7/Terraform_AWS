provider "aws" {

    region = "us-east-1"
    shared_config_files = ["$HOME/.aws/config"]
    shared_credentials_files = ["$HOME/.aws/credentials"]
  
}

resource "aws_iam_user" "IAM_User" {
    name = "Kira"
}

resource "aws_iam_user_policy_attachment" "admin_policy" {

    user = aws_iam_user.IAM_User.name
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  
}

# arn:aws:iam::aws:policy/AdministratorAccess