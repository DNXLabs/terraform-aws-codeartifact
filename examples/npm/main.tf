provider "aws" {
  region = "us-east-1"
}

module "npm_repo" {
    source = "../../"

    domain = "npm-test-domain"
    repositories = {
        npm = {
            name = "npm-repo"
        },
        npm_with_public_upstream = {
            name = "npm_with_public_upstream"
            external_connections = "public:npmjs"
        }
    }
}