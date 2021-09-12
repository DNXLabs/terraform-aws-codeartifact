# aws codeartifact terraform module

Terraform module which creates AWS CodeArtifact resources

## Usage

```hcl
module "codeartifact" {
    source  = "shepherd44/codeartifact/aws"

    domain = "domain-name"
    description = "codeartifact domain" # optional
    repositories = {
        repo = {
            name = "repository_name"
            description = "repository description"
            upstreams = ["upstream_name"]
            external_connections = "public-upstream-name"
        }
    }
}
```

### public upstream names

* public:npmjs - for the npm public repository.
* public:pypi - for the Python Package Index.
* public:maven-central - for Maven Central.
* public:maven-googleandroid - for the Google Android repository.
* public:maven-gradleplugins - for the Gradle plugins repository.
* public:maven-commonsware - for the CommonsWare Android repository.
