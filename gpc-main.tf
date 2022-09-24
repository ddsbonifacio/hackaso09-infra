resource "google_artifact_registry_repository" "frontend-repo" {
  location = "us-east1"
  repository_id = "hacka_09_frontend-repo"
  description = "Registry to store images of the front end application"
  format = "DOCKER"
}

resource "google_artifact_registry_repository" "backend-repo" {
  location = "us-east1"
  repository_id = "hacka_09_backend-repo"
  description = "Registry to store images of the back end application"
  format = "DOCKER"
}

resource "google_sql_database_instance" "instance" {
  name = "spotmusic_instance"
  database_version = "MYSQL_8_0"
  region = "us-east1"
  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "database" {
  name = "playlist"
  instance = "{google_sql_database_instance.instance.name}"
  charset = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "users" {
  name = "root"
  instance = "{google_sql_database_instance.instance.name}"
  host = "%"
  password = "mypassw0rd"
}

resource "google_sql_user" "playuser" {
  name = "playuser"
  instance = "{google_sql_database_instance.instance.name}"
  host = "%"
  password = "123456"
}