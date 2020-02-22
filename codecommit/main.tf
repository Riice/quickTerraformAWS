resource "aws_codecommit_repository" "main-one-repository" {
  repository_name = "main-one-repository"
  description     = "This is the Sample App Repository called Main1"
}

resource "aws_codecommit_repository" "sub-two-repository" {
  repository_name = "main-one-repository"
  description     = "This is the Sample App Repository called Sub2"
}

data "aws_iam_user" "git_pull" {
  user_name = "git_pull"
  
}