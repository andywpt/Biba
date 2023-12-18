#!/bin/sh

#  FirebaseConfig.sh
#  Biba
#
#  Created by Andy Wu on 2023/12/17.
#

INFO_PLIST=GoogleService-Info.plist

DEBUG_INFO_PLIST=${PROJECT_DIR}/${TARGET_NAME}/Firebase\ Config/Debug/${INFO_PLIST}
RELEASE_INFO_PLIST=${PROJECT_DIR}/${TARGET_NAME}/Firebase\ Config/Release/${INFO_PLIST}

echo "Checking ${INFO_PLIST} in ${DEBUG_INFO_PLIST}"
if [ ! -f $DEBUG_INFO_PLIST ] ; then
    echo "Debug GoogleService-Info.plist not found."
    exit 1
fi

echo "Checking ${INFO_PLIST} in ${RELEASE_INFO_PLIST}"
if [ ! -f $RELEASE_INFO_PLIST ] ; then
    echo "Release GoogleService-Info.plist not found."
    exit 1
fi

PLIST_DESTINATION=${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app
echo "Copying ${INFO_PLIST} to final destination: ${PLIST_DESTINATION}"

if [ "${CONFIGURATION}" == "Release" ] ; then
    echo "Copied ${RELEASE_INFO_PLIST}."
    cp "${RELEASE_INFO_PLIST}" "${PLIST_DESTINATION}"
else
    echo "Copied ${DEBUG_INFO_PLIST}."
    cp "${DEBUG_INFO_PLIST}" "${PLIST_DESTINATION}"
fi

