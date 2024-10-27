resource "google_sql_database_instance" "db_instance" {
  name             = "asistencias-db"
  database_version = "MYSQL_8_0"
  region           = var.region

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_user" "users" {
  instance = google_sql_database_instance.db_instance.name
  name     = var.db_username
  password = var.db_password
}

resource "google_sql_database" "database" {
  name     = "asistencias_app_db"
  instance = google_sql_database_instance.db_instance.name
}
