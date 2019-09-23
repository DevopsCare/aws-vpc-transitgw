resource "aws_ec2_transit_gateway_vpc_attachment" "eks-vpc" {
  subnet_ids         = data.aws_subnet_ids.private.ids
  transit_gateway_id = var.shared_tgw_id
  vpc_id             = var.vpc_id
}

resource "aws_route" "private-route" {
  count                  = length(data.aws_route_tables.private.ids)
  route_table_id         = element(tolist(data.aws_route_tables.private.ids), count.index)
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = var.shared_tgw_id
}

resource "aws_route" "public-route" {
  count                  = length(data.aws_subnet_ids.public.ids)
  route_table_id         = element(tolist(data.aws_route_tables.public.ids), count.index)
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = var.shared_tgw_id
}

