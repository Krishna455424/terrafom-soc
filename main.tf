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

resource "signalfx_detector" "cpu_high" {
  name = "High CPU Utilization Detector"

  program_text = <<-EOF
    A = data("cpu.utilization").publish(label="CPU")
    detect(when(A > 0.5)).publish("High CPU")
  EOF

  rule {
    description = "CPU usage is above 50%"
    severity    = "Major"
    detect_label = "High CPU"

    notifications = [
      "Email,hssrikrishna39@gmail.com"
    ]
  }
}