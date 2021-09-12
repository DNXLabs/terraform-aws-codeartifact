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
