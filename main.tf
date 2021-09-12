data "aws_region" "current" {}

resource "aws_codeartifact_domain" "domain" {
  domain         = var.domain
  encryption_key = var.kms_key_arn
  tags           = var.tags
}

resource "aws_codeartifact_repository" "repositories" {
  for_each = var.repositories
  depends_on = [resource.aws_codeartifact_domain.domain]

  domain     = aws_codeartifact_domain.domain.domain
  repository = lookup(each.value, "name", each.key)
  description = lookup(each.value, "description", null)
  tags = lookup(each.value, "tags", null)

  dynamic upstream {
    for_each = lookup(each.value, "upstreams", [])
    content {
      repository_name = upstream.value
    }
  }

  dynamic external_connections {
    for_each = lookup(each.value, "external_connections", null) != null ? [lookup(each.value, "external_connections")] : []
    content {
      external_connection_name = external_connections.value
    }
  }
}
