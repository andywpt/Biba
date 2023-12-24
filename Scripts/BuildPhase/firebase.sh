#!/bin/sh

#  FirebaseConfig.sh
#  Biba
#
#  Created by Andy Wu on 2023/12/17.
#

# Make sure to chmod u+x Build-Phases/my-script.sh

SOURCE_PATH=${PROJECT_DIR}/Firebase
TARGET_PATH=${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist

file=""
if [ "${CONFIGURATION}" == "Release" ] ; then
    file=${SOURCE_PATH}/GoogleService-Info-Prod.plist
else
    file=${SOURCE_PATH}/GoogleService-Info-Stage.plist
fi

if [ ! -f $file ] ; then
    echo "Missing file at ${file}"
    exit 1
fi

cp "${file}" "${TARGET_PATH}"


