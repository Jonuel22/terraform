variable "project" {
  description = "Nombre del proyecto en Google Cloud o Azure"
  default     = "your-project-name"
}

variable "region" {
  description = "Región de despliegue"
  default     = "us-central1"
}

variable "cluster_name" {
  description = "Nombre del clúster de Kubernetes"
  default     = "quarkus-vertx-cluster"
}

variable "db_username" {
  description = "Usuario de la base de datos"
  default     = "jcollado"
}

variable "db_password" {
  description = "Contraseña de la base de datos"
  default     = "jcollado"
}
