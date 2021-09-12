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
    depends_on = [
      aws_codeartifact_repository.repositories
    ]
    value = {
        for repo in aws_codeartifact_repository.repositories:
            repo.repository => repo.arn
    }
    description = "repository arn list"
}

output "repositories_endpoint" {
    depends_on = [
      aws_codeartifact_repository.repositories
    ]
    value = {
        for repo in aws_codeartifact_repository.repositories:
            repo.repository => {
                "npm": "https://${repo.domain}-${repo.domain_owner}.d.codeartifact.${data.aws_region.current.name}/npm/${repo.repository}/"
                "maven": "https://${repo.domain}-${repo.domain_owner}.d.codeartifact.${data.aws_region.current.name}/maven/${repo.repository}/"
                "gradle": "https://${repo.domain}-${repo.domain_owner}.d.codeartifact.${data.aws_region.current.name}/maven/${repo.repository}/"
                "pip": null
                "twine": null
                "nuget": null
            }
    }
    description = "repository endpoint list"
}
