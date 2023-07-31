resource "google_bigquery_dataset" "cis" {
  project                         = var.project_id
  dataset_id                      = var.application
  default_partition_expiration_ms = 2592000000  # 30 days
  default_table_expiration_ms     = 31536000000 # 365 days
  description                     = "CIS BenchMark Results"
  location                        = "EU"
  max_time_travel_hours           = 48 # 2 days

  labels = {
    billing_group = "security",
    pii           = "sensitive"
  }
}