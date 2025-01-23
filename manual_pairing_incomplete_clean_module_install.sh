#!/bin/bash
. ~/.bash_profile
MODULE_NAME=$1
MODULE_VERSION=$2
MODULE_TAR_RELEASE=$3
MODULE_FOLDER=$4

########################################################

mkdir -p $RELEASE_PATH/${MODULE_FOLDER}/

mkdir -p $RELEASE_PATH/${MODULE_FOLDER}/${MODULE_NAME}/${MODULE_VERSION}

cd $RELEASE_PATH/${MODULE_FOLDER}/${MODULE_NAME}/${MODULE_VERSION}

tar -xzvf ${MODULE_TAR_RELEASE}.tar.gz >> ${MODULE_TAR_RELEASE}_untar_log.txt

mv $RELEASE_PATH/${MODULE_FOLDER}/${MODULE_NAME}/${MODULE_VERSION}/${MODULE_NAME}_${MODULE_VERSION}.jar $RELEASE_HOME/binary


mkdir -p $APP_HOME/${MODULE_FOLDER}/${MODULE_NAME}

cd $APP_HOME/${MODULE_FOLDER}/${MODULE_NAME}

ln -s $RELEASE_HOME/binary/${MODULE_NAME}_${MODULE_VERSION}.jar ${MODULE_NAME}.jar

mv $RELEASE_PATH/${MODULE_FOLDER}/${MODULE_NAME}/${MODULE_VERSION}/application.properties $APP_HOME/${MODULE_FOLDER}/${MODULE_NAME}

ln -s $RELEASE_HOME/global_config/log4j2.xml log4j2.xml

mv $RELEASE_PATH/${MODULE_FOLDER}/${MODULE_NAME}/${MODULE_VERSION}/start.sh  $APP_HOME/${MODULE_FOLDER}/${MODULE_NAME}



chmod +x $APP_HOME/${MODULE_FOLDER}/${MODULE_NAME}/start.sh


echo "++++++++++++Application Installation completed+++++++++++"
