set server=invest@195.34.235.94
set admin_path=/home/invest/repository/admin
set cclient_path=/home/invest/repository/client
ssh %server% "bash --login -c 'cd %client_path% && git pull && bower install && brunch build'"
ssh %server% "bash --login -c '[ -d %client_path%/public/uploads ] || ln -s %admin_path%/shared/uploads %client_path%/public/uploads'"
