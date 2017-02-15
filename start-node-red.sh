#!/bin/sh

if [ "$NODERED_USER" = "" ] || [ "$NODERED_PWHASH" = "" ]; then
	echo Skipping creation of settings.js. Try setting the NODERED_USER and NODERED_PWHASH environment variables.
else
	echo Creating /data/settings.js

	echo 'module.exports = {
	adminAuth: {
    	type: "credentials",
    	users: [{
        	username: "'"$NODERED_USER"'",
        	password: "'"$NODERED_PWHASH"'",
        	permissions: "*"
    	}]
    }
}' > /data/settings.js

fi

echo Starting Node-RED

#while [ 1 ]; do
	npm start -- --userDir /data
#done