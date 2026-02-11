
#Cluster role policy
resource "aws_iam_role" "clusterrole" {
    name = "eks_cluster_role"

    assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
  
}

resource "aws_iam_role_policy_attachment" "policy1" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role = aws_iam_role.clusterrole.name
  
}



#node role policy
resource "aws_iam_role" "noderole" {
    name = "eks_node_role"

    assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  
}

resource "aws_iam_role_policy_attachment" "policy2" {
    role = aws_iam_role.noderole.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "policy3" {
    role = aws_iam_role.noderole.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "policy4" {
    role = aws_iam_role.noderole.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}