resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "events-cluster"
  engine                  = "docdb"
  master_username         = "${var.mongouser}"
  master_password         = "${var.mongopassword}"
}