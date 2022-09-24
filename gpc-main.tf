resource "google_artifact_registry_repository" "frontend-repo" {
  location = "us-east1"
  repository_id = "hacka-09-frontend-repo"
  description = "Registry to store images of the front end application"
  format = "DOCKER"
}

resource "google_artifact_registry_repository" "backend-repo" {
  location = "us-east1"
  repository_id = "hacka-09-backend-repo"
  description = "Registry to store images of the back end application"
  format = "DOCKER"
}

resource "google_sql_database_instance" "instance3" {
  name = "spotmusicinstance3"
  database_version = "MYSQL_8_0"
  region = "us-east1"
  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "database1" {
  name = "playlist"
  instance = "spotmusicinstance3"
  charset = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "playuser" {
  name = "playuser"
  instance = "spotmusicinstance3"
  host = "%"
  password = "123456"
}