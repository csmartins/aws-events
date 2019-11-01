resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "events-cluster"
  engine                  = "docdb"
  master_username         = "${var.mongouser}"
  master_password         = "${var.mongopassword}"
}

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "docdb-cluster-events-${count.index}"
  cluster_identifier = "${aws_docdb_cluster.docdb.id}"
  instance_class     = "db.r4.large"
}