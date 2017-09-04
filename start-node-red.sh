#!/bin/sh

if [ "$NODERED_USER" = "" ] || [ "$NODERED_PWHASH" = "" ]; then
	echo Skipping creation of settings.js. Try setting the NODERED_USER and NODERED_PWHASH environment variables.
else
	echo Creating /data/settings.js

	if [ "$NODERED_LOGLEVEL" = "" ]; then
		export NODERED_LOGLEVEL=info
	fi

	if [ "$NODERED_HTTP_ROOT" = "" ]; then
		export NODERED_HTTP_ROOT=/
	fi

	echo 'module.exports = {
	adminAuth: {
    	type: "credentials",
    	users: [{
        	username: "'"$NODERED_USER"'",
        	password: "'"$NODERED_PWHASH"'",
        	permissions: "*"
    	}]
  },
	logging: {
  		console: {
					level: "'"$NODERED_LOGLEVEL"'"
			}
  },
	httpRoot: "'"$NODERED_HTTP_ROOT"'",

}' > /data/settings.js

fi

echo Starting Node-RED

#while [ 1 ]; do
	npm start -- --userDir /data
#done
