source ~/.bash_profile

source $commonConfigurationFilePath
dbDecryptPassword=$(java -jar  ${APP_HOME}/encryption_utility/PasswordDecryptor-0.1.jar spring.datasource.password)

mysql  -h$dbIp -P$dbPort -u$dbUsername -p${dbDecryptPassword} $appdbName <<EOFMYSQL


insert into sys_param(tag,value,feature_name) values  ('mgmt_init_start_clean_up_hours','10','manual_pairing_incomplete_clean');



EOFMYSQL
