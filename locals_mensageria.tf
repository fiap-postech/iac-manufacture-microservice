locals {
  subscription = {
    purchase_created_topic = {
      name                 = "prd-purcharse-created-topic"
      protocol             = "sqs"
      raw_message_delivery = true
    }
  }

  sqs = {
    name                       = "prd-manufacture-purchase-created-queue"
    delay_seconds              = 0
    max_message_size           = 262144
    message_retention_seconds  = 86400
    receive_wait_time_seconds  = 0
    visibility_timeout_seconds = 60
    sqs_managed_sse_enabled    = true
  }
}