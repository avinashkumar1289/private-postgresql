/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  description = "The ID of the project in which resources will be provisioned."
  type        = string    
}

variable "region" {
  type        = string
  description = "The region to host the postgresql database"
  default     = null
}

variable "zone" {
  type        = string
  description = "The zone for postgresql database"
  default     = null
}

variable "authorized_networks" {
  default = [{
    name  = "sample-gcp-health-checkers-range"
    value = "130.211.0.0/28"
  }]
  type        = list(map(string))
  description = "List of mapped public networks authorized to access to the instances. Default - short range of GCP health-checkers IPs"
}

variable "db_name" {
  description = "The name of the SQL Database instance"
  default     = "example-postgres-private"
}

variable "vpc_network" {
  description = "Existing VPC network to which instances are connected. The networks needs to be configured with https://cloud.google.com/vpc/docs/configure-private-services-access."
  type     = string
  default  = "shared-net"
}

variable "shared_host_project_id" {
  description = "The Project ID of the shared host project"
  type     = string
  default  = ""

}

variable "subnet_name" {
  description = "The subnetwork to host the cluster in (required)"
  type        = string
  default     = ""

}
variable "service_account_roles" {
  type = list(string)

  description = "List of IAM roles to assign to the service account."
  default = [
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/monitoring.viewer",
    "roles/compute.osLogin",
  ]
}

variable "scopes" {
  type = list(string)

  description = "List of scopes to attach to the bastion host"
  default     = ["cloud-platform"]
}

variable "router_name" {
  description = "The name of the GCP Router to associate the NAT to"
}