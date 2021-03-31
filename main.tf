terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "3.60.0"
        }
    }
}


#------ MySQL Instance

resource "google_sql_database" "database" {
  name     = "mysql_correa_integrationtest_db"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_database" "database2" {
  name     = "mysql_correa_qa_db"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_database_instance" "instance" {
  name   = "mysql-instance"
  region = "us-central1"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "false"
}

resource "google_sql_user" "mysql_user" {
    name = "mysql_user"
    instance = google_sql_database_instance.instance.name
    password = "sqlrocks@cit326"
}


#------ PostgreSQL Instance

resource "google_sql_database" "database3" {
  name     = "postgres_correa_integrationtest_db"
  instance = google_sql_database_instance.instance2.name
}

resource "google_sql_database" "database4" {
  name     = "postgres_correa_qa_db"
  instance = google_sql_database_instance.instance2.name
}

resource "google_sql_database_instance" "instance2" {
  name   = "postgres-instance"
  database_version = "POSTGRES_13"
  region = "us-central1"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "false"
}

resource "google_sql_user" "postgres_user" {
    name = "postgres_user"
    instance = google_sql_database_instance.instance2.name
    password = "sqlrocks@cit326"
}



