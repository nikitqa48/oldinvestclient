setlocal
set client_data_path=.\public\data
mkdir "%client_data_path%"
set server_data_url=http://mapadmin.invest-lipetsk.ru/export?callback=dataLoaderCallback

for %%i in (ru en) do (
	REM echo "%url%&l=%%i"
	curl "%server_data_url%&l=%%i" > %client_data_path%/%%i.jsonp
)

set client_uploads_directory=.\public
set server_uploads_directory=/home/invest/repository/admin/shared

cd %client_uploads_directory%
ssh invest@195.34.235.94 "bash --login -c 'cd %server_uploads_directory% && tar cfz uploads.tar.gz uploads'"
scp invest@195.34.235.94:%server_uploads_directory%/uploads.tar.gz uploads.tar.gz
ssh invest@195.34.235.94 "bash --login -c 'cd %server_uploads_directory% && rm uploads.tar.gz'"
tar xvf uploads.tar.gz
rm uploads.tar.gz
endlocal