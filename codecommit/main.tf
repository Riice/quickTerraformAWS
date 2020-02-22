# Declaration and Data retrieval for Main Repo
resource "aws_codecommit_repository" "main-one-repository" {
  repository_name = "main-one-repository"
  description     = "This is the Sample App Repository called Main1"
}

data "aws_codecommit_repository" "test" {
  repository_name = "MyTestRepository"
  arn = "main-repo-arn"
}

# Declaration and Data retrieval for Secondary Repo
resource "aws_codecommit_repository" "sub-two-repository" {
  repository_name = "main-one-repository"
  description     = "This is the Sample App Repository called Sub2"
}

data "aws_codecommit_repository" "test" {
  repository_name = "MyTestRepository"
  arn = "sub-repo-arn"
}

data "aws_iam_user" "git_pull" {
  user_name = "git_pull"
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
           main-repo-arn,
           sub-repo-arn
      ]
    }
  ]
}
EOF  
}

resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"


}