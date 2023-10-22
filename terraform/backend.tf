terraform {
  backend "gcs" {
    credentials = "ppetrov-internal-402521-9e7e2e9cdcaf.json"
    bucket      = "ex-zh-part1"
    prefix      = "cloud-run"
  }
}