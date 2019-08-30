#!/bin/bash

export CVMANAGER_DIR=/root/Code/katello-cvmanager
export CVMANAGER_CONFIG_DIR=/root/cvmanager

pushd . > /dev/null
cd ${CVMANAGER_DIR}
echo -e "\e[1m\e[34mPROD - Publishing\e[0m"
./cvmanager --config=${CVMANAGER_CONFIG_DIR}/uxwh-prod.yaml --wait publish
echo -e "\e[1m\e[34mPROD - Updating\e[0m"
./cvmanager --config=${CVMANAGER_CONFIG_DIR}/uxwh-prod.yaml --wait update
# Publish is not needed since the CCVs are set to auto publish
echo -e "\e[1m\e[34mPROD - Promoting\e[0m"
./cvmanager --config=${CVMANAGER_CONFIG_DIR}/uxwh-prod.yaml --wait promote
echo -e "\e[1m\e[34mPROD - Cleaning\e[0m"
./cvmanager --config=${CVMANAGER_CONFIG_DIR}/uxwh-prod.yaml --wait clean

echo -e "\e[1m\e[34mDEV - Publishing\e[0m"
./cvmanager --config=${CVMANAGER_CONFIG_DIR}/uxwh-dev.yaml --wait publish
echo -e "\e[1m\e[34mDEV - Updating\e[0m"
./cvmanager --config=${CVMANAGER_CONFIG_DIR}/uxwh-dev.yaml --wait update
echo -e "\e[1m\e[34mDEV - Promoting\e[0m"
./cvmanager --config=${CVMANAGER_CONFIG_DIR}/uxwh-dev.yaml --wait promote
echo -e "\e[1m\e[34mDEV - Cleaning\e[0m"
./cvmanager --config=${CVMANAGER_CONFIG_DIR}/uxwh-dev.yaml --wait clean
popd > /dev/null
