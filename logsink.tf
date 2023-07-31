
resource "google_logging_project_sink" "cis_log_sink" {
    name        = var.application
    description = "log sink to sink gke Kube-bench logs to BiqQuert"
    destination = "bigquery.googleapis.com/projects/${var.project_id}/datasets/${google_bigquery_dataset.cis.dataset_id}"
    filter      = "resource.type=\"k8s_container\" AND resource.labels.project_id=\"${var.project_id}\" AND resource.labels.location=\"${var.gke_zone}\" AND resource.labels.cluster_name=\"${var.application}\" AND resource.labels.container_name=\"kube-bench\" AND (textPayload:\"[INFO]\" OR textPayload:\"[WARN]\" OR textPayload:\"[PASS]\" OR textPayload:\"[FAIL]\") AND severity>=DEFAULT"
    
    unique_writer_identity = true
    bigquery_options {
        use_partitioned_tables = false 
  }

  depends_on = [google_bigquery_dataset.cis]
}

resource "google_project_iam_member" "log_writer" {
    project = var.project_id
    role = "roles/bigquery.dataEditor"
    member = google_logging_project_sink.cis_log_sink.writer_identity
}