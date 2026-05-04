resource "signalfx_time_chart" "cpu" {
  name = "CPU Utilization"

  program_text = <<-EOF
    A = data("cpu.utilization").publish(label="CPU")
  EOF
}

resource "signalfx_time_chart" "memory" {
  name = "Memory Utilization"

  program_text = <<-EOF
    A = data("memory.utilization").publish(label="Memory")
  EOF
}