#!/bin/bash

if [[ "0" == ${CIRCLE_NODE_INDEX} ]]
then
	echo controller
	python -m http.server 8080 &
	sleep 5
	curl --verbose --max-time 5 http://localhost:8080
	ngrok http --subdomain=${CIRCLE_WORKFLOW_ID} 8080
else
	echo agent
	sleep 30
	echo "curl'ing https://${CIRCLE_WORKFLOW_ID}.ngrok.io/"
	curl --verbose --max-time 5 https://${CIRCLE_WORKFLOW_ID}.ngrok.io/
fi
