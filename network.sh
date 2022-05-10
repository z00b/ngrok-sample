#!/bin/bash

if [[ "0" == ${CIRCLE_NODE_INDEX} ]]
then
	echo controller
	echo ${CIRCLE_WORKFLOW_ID}
else
	echo agent
	echo ${CIRCLE_WORKFLOW_ID}
fi
