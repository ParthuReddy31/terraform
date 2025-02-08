    bucket = "parthu-tf-remote-state-prod"
    key    = "expense-infra-prod" #you should have unique key with-in the bucket, same key should not be used in other repos
    region = "us-east-1"
    dynamodb_table = "parthu-tf-remote-state-prod-db" 