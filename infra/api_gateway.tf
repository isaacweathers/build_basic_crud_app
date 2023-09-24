resource "aws_api_gateway_rest_api" "http-crud-tutorial-api" {
  name        = "http-crud-tutorial-api-api"
  description = "http-crud-tutorial-api API Gateway"
}

resource "aws_api_gateway_resource" "http-crud-tutorial-api_resource" {
  rest_api_id = aws_api_gateway_rest_api.http-crud-tutorial-api.id
  parent_id   = aws_api_gateway_rest_api.http-crud-tutorial-api.root_resource_id
  path_part   = "items"
}

resource "aws_api_gateway_method" "http-crud-tutorial-api_method" {
  rest_api_id   = aws_api_gateway_rest_api.http-crud-tutorial-api.id
  resource_id   = aws_api_gateway_resource.http-crud-tutorial-api_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "http-crud-tutorial-api_method_put" {
  rest_api_id   = aws_api_gateway_rest_api.http-crud-tutorial-api.id
  resource_id   = aws_api_gateway_resource.http-crud-tutorial-api_resource.id
  http_method   = "PUT"
  authorization = "NONE"
}

resource "aws_api_gateway_resource" "http-crud-tutorial-api_resource_id" {
  rest_api_id = aws_api_gateway_rest_api.http-crud-tutorial-api.id
  parent_id   = aws_api_gateway_rest_api.http-crud-tutorial-api.root_resource_id
  path_part   = "items/{id}"
}

resource "aws_api_gateway_method" "http-crud-tutorial-api_method" {
  rest_api_id   = aws_api_gateway_rest_api.http-crud-tutorial-api.id
  resource_id   = aws_api_gateway_resource.http-crud-tutorial-api_resource_id.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "http-crud-tutorial-api_method_put" {
  rest_api_id   = aws_api_gateway_rest_api.http-crud-tutorial-api.id
  resource_id   = aws_api_gateway_resource.http-crud-tutorial-api_resource_id.id
  http_method   = "PUT"
  authorization = "NONE"
}
