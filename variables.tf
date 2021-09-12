variable "domain" {
    type = string
}

variable "kms_key_arn" {
    type = string
    default = ""
}

variable "tags" {
    type = map(string)
    default = null
}

variable "repositories" {
    type = any
    description = <<-EOT
    repository map

    example

    ```
    {
      npm = {
           repository = "test" # optional. if not set, use key
           description = "test description"
           upstreams = ["test description"]
           external_connections = "test description"
      }
    }
    ```

    external_connections

    * public:npmjs - for the npm public repository.
    * public:pypi - for the Python Package Index.
    * public:maven-central - for Maven Central.
    * public:maven-googleandroid - for the Google Android repository.
    * public:maven-gradleplugins - for the Gradle plugins repository.
    * public:maven-commonsware - for the CommonsWare Android repository.
    EOT
}
