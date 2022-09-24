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
  name = "spot_music_db_instance"
  database_version = "MYSQL_8_0"
  region = "us-east1"
  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "database" {
  name = "playlist"
  instance = "spot_music_db_instance"
  charset = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "users" {
  name = "root"
  instance = "spot_music_db_instance"
  host = "%"
  password = "mypassw0rd"
}

resource "google_sql_user" "playuser" {
  name = "playuser"
  instance = "spot_music_db_instance"
  host = "%"
  password = "123456"
}