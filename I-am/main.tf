# create i-am Role
resource "aws_iam_role" "ec2" {
  name = "ec2-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  }

  #create i-am policy
 resource "aws_iam_policy" "s3readonly" {
  name        = "S3ReadOnlyPolicy"
  path        = "/"
  description = "Provides read-only access to S3 buckets"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:Get*",
          "s3:List*"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}


#attach policy to role
resource "aws_iam_policy_attachment" "attach-s3-policy" {
    name = "attach-s3-policy"
    policy_arn = aws_iam_policy.s3readonly.arn
    roles = [aws_iam_role.ec2.name]
}

# Create Instance Profile (required for EC2 to assume the role)
resource "aws_iam_instance_profile" "ec2_profile" {
    name = "ec2-instance-profile"
    role = aws_iam_role.ec2.name
  
}

#launch instance
resource "aws_instance" "ec2role" {
  ami="ami-0f7b02bb6a0e14062"
  instance_type="t2.micro"
  key_name= "dev2" 
}
