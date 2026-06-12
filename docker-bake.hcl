variable "VERSION" {
  # renovate: datasource=repology depName=alpine_3_24/tinyproxy
  default = "1.11.3-r0"
}

group "default" {
  targets = ["default"]
}

target "default" {
  tags = ["quay.io/seiferma/tinyproxy:${VERSION}", "quay.io/seiferma/tinyproxy:latest"]
  args = {
    VERSION = "${VERSION}"
  }
}
