#!/bin/sh

#  Env Script.sh
#  Biba
#
#  Created by Andy Wu on 2023/12/19.
#
CONFIG_PATH=${PROJECT_DIR}/${TARGET_NAME}/Config
ENV_FILE=${CONFIG_PATH}/.env
ENV_STAGE_FILE=${CONFIG_PATH}/.env.stage


echo "Checking ${ENV_FILE}"
if [ ! -f $ENV_FILE ] ; then
    echo ".env not found."
    exit 1
fi

echo "Checking ${ENV_STAGE_FILE}"
if [ ! -f $ENV_STAGE_FILE ] ; then
    echo ".env.stage not found."
    exit 1
fi

joined_values=""

if [ "${CONFIGURATION}" == "Release" ] ; then
    joined_values=$(sed -n 's/=/ /p' "$ENV_FILE" | awk '{printf "%s=\"%s\",", $1, $2}' | sed 's/,$//')
else
    joined_values=$(sed -n 's/=/ /p' "$ENV_STAGE_FILE" | awk '{printf "%s=\"%s\",", $1, $2}' | sed 's/,$//')
fi

echo "Joined Values $joined_values"

TEMPLATE_PATH=${CONFIG_PATH}/Config.stencil

# Run Sourcery Codegen
$PODS_ROOT/Sourcery/bin/sourcery --templates "${TEMPLATE_PATH}" --sources "${CONFIG_PATH}" --output "${CONFIG_PATH}" --args "$joined_values"
