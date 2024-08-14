provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform.virtualti.net"
    key    = "my-python-app/terraform.tfstate"
    region = "us-east-1"
  }
}


data "aws_ecs_cluster" "my_cluster" {
  cluster_name = "lab-ecs"
}

resource "aws_ecs_service" "my_service" {
  name            = "my-python-app-service"
  cluster         = data.aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task.arn
  desired_count   = 1
}

resource "aws_ecs_task_definition" "my_task" {
  family                   = "my-python-app-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = "my-python-app"
    image     = "${var.docker_image}"
    cpu       = 256
    memory    = 512
    essential = true
    portMappings = [{
      containerPort = 8080
      hostPort      = 8080
    }]
  }])
}
