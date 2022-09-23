
## variables for archival bucket
variable "archivalbucket" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_class" {
    type = string
  
}

### Landing bucket & pubsub topics, subscriptions variables

variable "landingbucket" {
  type = string
}
variable "topic_name" {
    type = string
  
}

variable "subscription_name" {
    type = string
  

#variables for bigquery

}
variable project {
  type        = string
}
variable zone {
  type        = string
}

variable region {
  type        = string
}


variable datasetID {
  type        = string
}

variable table {
  type        = string
}

#service account
variable "serviceaccount" {
    type = string
}


## display names for service accounts

variable "display_name" {
  type = string
}


### required roles for service accounts

variable "role1" {
    type = string
}

variable "role2" {
    type = string

}

  



