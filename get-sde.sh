#!/bin/bash

SDEURL=https://cdn1.eveonline.com/data/sde/tranquility/sde-20180323-TRANQUILITY.zip

FILE=$(readlink -f $0)
SCRIPT_DIR=$(dirname $FILE)

pushd $SCRIPT_DIR > /dev/null

echo "Downloading $SDEURL to sde.zip"
wget $SDEURL -O sde.zip

echo "Extracting required YAML files from sde.zip"
unzip -j sde.zip \
  sde/fsd/categoryIDs.yaml \
  sde/fsd/groupIDs.yaml \
  sde/fsd/typeIDs.yaml \
  sde/bsd/dgmAttributeTypes.yaml \
  sde/bsd/dgmTypeAttributes.yaml

popd > /dev/null
