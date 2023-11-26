variable "docker_host" {
  description = "The Docker Host where contains will be deployed"
  type        = string
  default     = "unix:///var/run/docker.sock"
}
