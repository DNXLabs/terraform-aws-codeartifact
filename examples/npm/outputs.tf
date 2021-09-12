output "domain_name" {
    value = module.npm_repo.domain_name
}

output "domain_arn" {
    value = module.npm_repo.domain_arn
}

output "domain_repos_arn" {
    value = module.npm_repo.repositories_arn
}

output "domain_repos_endpoint" {
    value = module.npm_repo.repositories_endpoint
}
