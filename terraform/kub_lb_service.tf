provider "kubernetes" {
  config_path = "~/.kube/config"
}
resource "kubernetes_service" "backend" {
  metadata {
    name = "backend"
  }
  spec {
    selector = {
      app = "backend"
    }
    port {
      port        = 80
      target_port = 8080
    }
    type = "LoadBalancer"
  }
}
# Wait for the Load Balancer to be provisioned and get its DNS name
data "external" "get_lb_dns" {
  program = ["sh", "-c", <<EOF
  kubectl get svc my-service -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
EOF
  ]
}
output "lb_dns" {
  value = data.external.get_lb_dns.result
}