/*
* Copyright (c) 2020 Risk Focus Inc.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

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

