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

data "aws_subnet_ids" "private" {
  vpc_id = var.vpc_id

  tags = {
    type = "private"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = var.vpc_id

  tags = {
    type = "public"
  }
}

data "aws_route_tables" "private" {
  vpc_id = var.vpc_id

  tags = {
    type = "private"
  }
}

data "aws_route_tables" "public" {
  vpc_id = var.vpc_id

  tags = {
    type = "public"
  }
}

