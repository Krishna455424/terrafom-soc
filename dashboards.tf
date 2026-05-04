resource "signalfx_dashboard_group" "infra_group" {
  name        = "Infra Dashboards"
  description = "Managed by Terraform"
}

resource "signalfx_dashboard" "infra_dashboard" {
  name            = "GitOps Infra Dashboard"
  description     = "Terraform-managed Observability dashboard"
  dashboard_group = signalfx_dashboard_group.infra_group.id

  time_range = "-15m"

  # CPU chart
  chart {
    chart_id = signalfx_time_chart.cpu.id
  }

  # Memory chart
  chart {
    chart_id = signalfx_time_chart.memory.id
  }
}