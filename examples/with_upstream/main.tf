provider "aws" {
  region = "us-east-1"
}

module "npm_repo" {
    source = "../../"

    domain = "npm-test-domain"
    repositories = {
        npm = {
            name = "npm"
            description = "npm repository"
            tags = {
                Name = "npm repository"
            }
        },
        npm_with_upstream = {
            name = "npm_with_upstream"
            upstreams = ["npm"]
        }
    }
    tags = {
        Name = "domain"
    }
}

output "domain_name" {
    value = module.npm_repo.domain_name
}

output "domain_arn" {
    value = module.npm_repo.domain_arn
}

output "domain_repos_arn" {
    value = module.npm_repo.repositories_arn
}