  #!/bin/bash

CLIENT_DATA_PATH="./public/data"
SERVER_DATA_URL="http://mapadmin.invest-lipetsk.ru/export?callback=dataLoaderCallback"
CLIENT_UPLOADS_DIRECTORY="./public"
SERVER_UPLOADS_DIRECTORY="/home/invest/repository/admin/shared"

mkdir -p $CLIENT_DATA_PATH

for language in ru en
do
	curl $SERVER_DATA_URL'&l='$language > $CLIENT_DATA_PATH'/'$language'.jsonp'
done

cd $CLIENT_UPLOADS_DIRECTORY
ssh invest@195.34.235.94 "bash --login -c 'cd $SERVER_UPLOADS_DIRECTORY && tar cfz uploads.tar.gz uploads'"
scp invest@195.34.235.94:$SERVER_UPLOADS_DIRECTORY/uploads.tar.gz uploads.tar.gz
ssh invest@195.34.235.94 "bash --login -c 'cd $SERVER_UPLOADS_DIRECTORY && rm uploads.tar.gz'"
tar xvf uploads.tar.gz
rm uploads.tar.gz