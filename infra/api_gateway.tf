resource "aws_api_gateway_rest_api" "http-crud-tutorial-api" {
  name        = "http-crud-tutorial-api-api"
  description = "http-crud-tutorial-api API Gateway"
}

resource "aws_api_gateway_resource" "http-crud-tutorial-api_resource" {
  rest_api_id = aws_api_gateway_rest_api.http-crud-tutorial-api.id
  parent_id   = aws_api_gateway_rest_api.http-crud-tutorial-api.root_resource_id
  path_part   = "http-crud-tutorial-api"
}

resource "aws_api_gateway_method" "http-crud-tutorial-api_method" {
  rest_api_id   = aws_api_gateway_rest_api.http-crud-tutorial-api.id
  resource_id   = aws_api_gateway_resource.http-crud-tutorial-api_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "http-crud-tutorial-api_integration" {
  rest_api_id             = aws_api_gateway_rest_api.http-crud-tutorial-api.id
  resource_id             = aws_api_gateway_resource.http-crud-tutorial-api_resource.id
  http_method             = aws_api_gateway_method.http-crud-tutorial-api_method.http_method
  integration_http_method = "GET"
  type                    = "HTTP"
  uri                     = "https://http-crud-tutorial-api.com"
  parent_id   = aws_api_gateway_rest_api.http-crud-tutorial-api.root_resource_id # In this case, the parent id should the gateway root_resource_id.
  path_part   = "items"
}


resource "aws_api_gateway_deployment" "http-crud-tutorial-api_deployment" {
  depends_on = [aws_api_gateway_integration.http-crud-tutorial-api_integration]
  rest_api_id = aws_api_gateway_rest_api.http-crud-tutorial-api.id
  stage_name  = "dev"
}

