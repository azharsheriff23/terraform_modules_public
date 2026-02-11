resource "aws_eks_cluster" "master" {
    name = var.clustername
    role_arn = aws_iam_role.clusterpolicy
    version = "1.34"
  
  depends_on = [ aws_iam_role.clusterrole ]

  vpc_config {
    
    subnet_ids = [aws_subnet.pubsub1.id,aws_subnet.pubsub2.id]
    
  }

}