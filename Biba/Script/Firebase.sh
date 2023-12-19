#!/bin/sh

#  FirebaseConfig.sh
#  Biba
#
#  Created by Andy Wu on 2023/12/17.
#

# Make sure to chmod u+x Build-Phases/my-script.sh

INFO_PLIST=GoogleService-Info.plist
RELEASE_INFO_PLIST=${PROJECT_DIR}/${TARGET_NAME}/App/GoogleService-Info-Prod.plist
DEBUG_INFO_PLIST=${PROJECT_DIR}/${TARGET_NAME}/App/GoogleService-Info-Stage.plist

if [ ! -f $DEBUG_INFO_PLIST ] ; then
    echo "Debug GoogleService-Info.plist not found."
    exit 1
fi

if [ ! -f $RELEASE_INFO_PLIST ] ; then
    echo "Release GoogleService-Info.plist not found."
    exit 1
fi

PLIST_DESTINATION=${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/${INFO_PLIST}
echo "Copying ${INFO_PLIST} to final destination: ${PLIST_DESTINATION}"

if [ "${CONFIGURATION}" == "Release" ] ; then
    echo "Copied ${RELEASE_INFO_PLIST}."
    cp "${RELEASE_INFO_PLIST}" "${PLIST_DESTINATION}"
else
    echo "Copied ${DEBUG_INFO_PLIST}."
    cp "${DEBUG_INFO_PLIST}" "${PLIST_DESTINATION}"
fi


