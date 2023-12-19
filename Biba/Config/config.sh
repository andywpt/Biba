#!/bin/sh

#  config.sh
#  Biba
#
#  Created by Andy Wu on 2023/12/19.
#

CONFIG_PATH=${PROJECT_DIR}/${TARGET_NAME}/Config
ENV_FILE=${CONFIG_PATH}/.env
ENV_STAGE_FILE=${CONFIG_PATH}/.env.stage
TEMPLATE_PATH=${CONFIG_PATH}/Config.stencil

if [ ! -f $ENV_FILE ] ; then
    echo ".env not found at ${ENV_FILE}"
    exit 1
fi

if [ ! -f $ENV_STAGE_FILE ] ; then
    echo ".env.stage not found at ${ENV_STAGE_FILE}"
    exit 1
fi

[[ "${CONFIGURATION}" == "Release" ]] && file="$ENV_FILE" || file="$ENV_STAGE_FILE"

arguments=$(sed -n 's/=/ /p' $file | awk '{printf "%s=\"%s\",", $1, $2}' | sed 's/,$//')

# Run Sourcery Codegen
$PODS_ROOT/Sourcery/bin/sourcery --templates $TEMPLATE_PATH --sources $CONFIG_PATH --output $CONFIG_PATH --args $arguments
