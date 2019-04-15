data "aws_subnet_ids" "private" {
  vpc_id = "${var.vpc_id}"

  tags = {
    type = "private"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = "${var.vpc_id}"

  tags = {
    type = "public"
  }
}


data "aws_route_tables" "private" {
  vpc_id = "${var.vpc_id}"

  tags = {
    type = "private"
  }
}

data "aws_route_tables" "public" {
  vpc_id = "${var.vpc_id}"

  tags = {
    type = "public"
  }
}
