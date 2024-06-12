#!/bin/bash

set -e

OUTPUT_COLOR='\x1b[32;1m'
NO_COLOR='\x1b[0m'

# This script is used to expand the secret files in the secrets directory
if [ -f "packer/variables.pkrvars.secure.hcl" ]; then
  echo -e "${OUTPUT_COLOR}Expanding the variables.pkrvars.secure.hcl file${NO_COLOR}"
  op inject -i packer/variables.pkrvars.secure.hcl -o packer/secured_folder/variables.pkrvars.hcl -f > /dev/null
  echo -e "${OUTPUT_COLOR}Done!${NO_COLOR}"
fi
if [ -f "packer/config/cloud-config.secure" ]; then
  echo -e "${OUTPUT_COLOR}Expanding the cloud-config.secure file${NO_COLOR}"
  op inject -i packer/config/cloud-config.secure -o packer/secured_folder/cloud-config -f > /dev/null
  echo -e "${OUTPUT_COLOR}Done!${NO_COLOR}"
fi

echo -e "${OUTPUT_COLOR}Complete!${NO_COLOR}"
