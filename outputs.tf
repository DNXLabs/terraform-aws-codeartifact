output "domain_name" {
  depends_on = [
    aws_codeartifact_domain.domain
  ]
  value = aws_codeartifact_domain.domain.domain
  description = "codeartifact domain name"
}

output "domain_arn" {
  depends_on = [
    aws_codeartifact_domain.domain
  ]
  value = aws_codeartifact_domain.domain.arn
  description = "codeartifact domain arn"
}

output "repository_count" {
  depends_on = [
    aws_codeartifact_domain.domain
  ]
  value = aws_codeartifact_domain.domain.repository_count
  description = "codeartifact repository count"
}

output "repositories_arn" {
    value = {
        for repo in aws_codeartifact_repository.repositories:
            repo.repository => repo.arn
    }
}