#!/bin/bash

set -e

packer build -var-file=./packer/secured_folder/variables.pkrvars.hcl ./packer/template.json.pkr.hcl