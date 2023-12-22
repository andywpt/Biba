#!/bin/sh

#  config.sh
#  Biba
#
#  Created by Andy Wu on 2023/12/19.
#

# This script should run before the complie step in build phase

CONFIG_PATH=${PROJECT_DIR}/${TARGET_NAME}/App/Config
TEMPLATE_PATH=${CONFIG_PATH}/Config.stencil
OUTPUT_PATH=$CONFIG_PATH/Config.swift

file=""
if [ "${CONFIGURATION}" == "Release" ] ; then
    file=${CONFIG_PATH}/.env
else
    file=${CONFIG_PATH}/.env.stage
fi

if [ ! -f $file ] ; then
    echo "Missing file at ${file}"
    exit 1
fi
# Arguments should be separated with , without spaces (i.e. arg1=value,arg2=value)
# To pass in string you should use escaped quotes (\")
arguments=$(sed -n 's/=/ /p' $file | awk '{printf "%s=\"%s\",", $1, $2}' | sed 's/,$//')

# Run Sourcery Codegen
$PODS_ROOT/Sourcery/bin/sourcery \
    --templates $TEMPLATE_PATH \
    --sources $CONFIG_PATH \
    --output $OUTPUT_PATH \
    --args $arguments

    
