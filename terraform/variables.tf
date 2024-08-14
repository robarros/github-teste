variable "subnets" {
  description = "IDs das subnets onde as tarefas do ECS serão executadas"
  type        = list(string)
  default     = ["subnet-0983998c1d5223003", "subnet-0d1fe7a89eff449d6", "subnet-0430d4128e1456a63"]

}

variable "security_group" {
  description = "ID do grupo de segurança para as tarefas do ECS"
  type        = string
  default     = "sg-00faaf45e126b2400"
}

variable "docker_image" {
  description = "Docker image for the application"
  type        = string
}
