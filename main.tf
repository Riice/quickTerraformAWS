# Set Provider
provider "aws" {
    region = "us-east-1"
}

# Declaration and Data retrieval for Main Repo
resource "aws_codecommit_repository" "main-one-repository" {
  repository_name = "main-one-repository"
  description     = "This is the Sample App Repository called Main1"
}

# Declaration and Data retrieval for Secondary Repo
resource "aws_codecommit_repository" "sub-two-repository" {
  repository_name = "sub-two-repository"
  description     = "This is the Sample App Repository called Sub2"
}

resource "aws_iam_user" "git_pull" {
  user_name = "git_pull"
}

resource "aws_iam_policy" {
    name = "git_pull_policy"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "codeCommit:**"
      ],
      "Effect": "Allow",
      "Resource": [
           "aws_codecommit_repository.sub-two-repository.id",
           "aws_codecommit_repository.main-one-repository.id"
      ]
    }
  ]
}
EOF  
}