#!/bin/bash

# DEfaults
SETUP_TITLE=${SETUP_TITLE:="GPS Track"}
ATTRIB_NAME=${ATTRIB_NAME:="Traccar"}
ATTRIB_LINK=${ATTRIB_LINK:="https://traccar.org"}
SETUP_COLOR=${SETUP_COLOR:="01162B"}
##GEOCODE_LINK=${GEOCODE_LINK:="https://nominatim.openstreetmap.org/"}
PLAY_LINK=${PLAY_LINK:="#"}
FRONT_LOGO_WIDTH=${FRONT_LOGO_WIDTH:="108"}
FRONT_LOGO_HEIGHT=${FRONT_LOGO_HEIGHT:="32"}
GOOGLE_API_KEY=${GOOGLE_API_KEY:="api-key"}
BACK_LOGO_WIDTH=${BACK_LOGO_WIDTH:="82"}
BACK_LOGO_HEIGHT=${BACK_LOGO_HEIGHT:="27"}

## Set for production mode
sed -i 's/GPSTRACK/'"$SETUP_TITLE"'/g' /opt/traccar/web/release.html
sed -i 's/ATTRIB_NAME/'"$ATTRIB_NAME"'/g' /opt/traccar/web/release.html
sed -i 's#ATTRIB_LINK#'"$ATTRIB_LINK"'#g' /opt/traccar/web/release.html

## Set for debug mode
sed -i 's/GPSTRACK/'"$SETUP_TITLE"'/g' /opt/traccar/web/debug.html
sed -i 's/ATTRIB_NAME/'"$ATTRIB_NAME"'/g' /opt/traccar/web/debug.html
sed -i 's#ATTRIB_LINK#'"$ATTRIB_LINK"'#g' /opt/traccar/web/debug.html

## Set for styles..
sed -i 's/808080/'"$SETUP_COLOR"'/g' /opt/traccar/web/assets/mod.css

## Set for address search
##sed -i 's#https://nominatim.openstreetmap.org/#'"$GEOCODE_LINK"'#g' /opt/traccar/web/assets/ol-geocoder.js
##sed -i 's#https://nominatim.openstreetmap.org/#'"$GEOCODE_LINK"'#g' /opt/traccar/web/assets/ol-geocoder.js.map

## Set public url for web
sed -i 's#$webUrl#'"$PUBLIC_URL"'#g' /opt/traccar/templates/full/passwordReset.vm

##Set for play store link
sed -i 's#PLAY_LINK#'"$PLAY_LINK"'#g' /opt/traccar/web/release.html
sed -i 's#PLAY_LINK#'"$PLAY_LINK"'#g' /opt/traccar/web/debug.html

## Set login page logo
sed -i 's/122/'"$FRONT_LOGO_WIDTH"'/g' /opt/traccar/web/app/view/dialog/Login.js
sed -i 's/43/'"$FRONT_LOGO_HEIGHT"'/g' /opt/traccar/web/app/view/dialog/Login.js
sed -i 's/width:122/'"width:$FRONT_LOGO_WIDTH"'/g' /opt/traccar/web/app.min.js
sed -i 's/height:43/'"height:$FRONT_LOGO_HEIGHT"'/g' /opt/traccar/web/app.min.js

## Set Google Mapi API key
sed -i 's/GOOGLE_API_KEY/'"$GOOGLE_API_KEY"'/g' /opt/traccar/web/app/Style.js

## Set Loggedin logo
sed -i 's/82px/'"$BACK_LOGO_WIDTH px"'/g' /opt/traccar/web/app.min.js
sed -i 's/27px/'"$BACK_LOGO_HEIGHT px"'/g' /opt/traccar/web/app.min.js

exec "$@"
