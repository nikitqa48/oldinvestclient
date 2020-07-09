#!/bin/bash
ROOT_PATH=$(pwd)
BOWER_COMPONENTS_PATH=$ROOT_PATH/"bower_components"

npm install
bower install

for LEAFLET_COMPONENT in "leaflet" "leaflet.markercluster" "Leaflet.label"
do
  cd $BOWER_COMPONENTS_PATH/$LEAFLET_COMPONENT
  npm install
  jake
done

cd $ROOT_PATH
brunch build --production
