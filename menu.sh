#!/bin/bash

TEST_MENU_VERSION=1.0
FUNCTION_NUM=0
TEST_MENU_LIST_ARRAY_NUM=0
ABOVE_TESTITEMS_ARRAY_NUM=0
TEST_TIME_DAY=`date +%m%d%H%M`
TEST_RESULT="test_${TEST_TIME_DAY}.txt"
BOARD_NAME=`echo ${1} | awk -F ".cfg" '{print $1}'`

#echo "Test Board" ${BOARD_NAME}

# load board_name.cfg file
source ./${1}

# load test test_api
source ./common/test_api

while [[ -z ${2} ]]
do
    echo "--------------------------------------"
    Show_Menu_All
    echo -e "\n"
    Choice_Test_Funtion

    ITEM_FUNCTION_NAME=`echo ${TEST_MENU_LIST} | cut -d" " -f ${FUNCTION_NUM}`
    echo "ITEM_FUNCTION_NAME:"$ITEM_FUNCTION_NAME
    FUNCTION_NAME=`echo $ITEM_FUNCTION_NAME | awk -F "_" '{print $4}'`
    echo "FUNCTION_NAME:"$FUNCTION_NAME
    ITEM_TEST_FUNC_${FUNCTION_NAME}
    echo -e "\n"
done

#ITEM_TEST_FUNC_AUTO
