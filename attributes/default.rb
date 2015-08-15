default['piwik']['version'] = '1.5.1'
default['piwik']['install_path'] = '/var/www'

default['piwik']['php_fcgi_memory_limit'] = '128M'
default['piwik']['php_fcgi_children'] = '5'
default['piwik']['php_fcgi_max_requests'] = '1000'
default['piwik']['php_fcgi_bind_path'] = '/tmp/.php-fcgi-socket'
default['piwik']['php_fcgi_pass'] = 'unix:/tmp/.php-fcgi-socket'

# Params used in slave recipe only:
default['piwik']['config']['superuser']['login'] = '' # override_attribute in role!
default['piwik']['config']['superuser']['password'] = '' # override_attribute in role!
default['piwik']['config']['superuser']['email'] = '' # override_attribute in role!
default['piwik']['config']['superuser']['salt'] = '' # override_attribute in role!
default['piwik']['config']['database']['host'] = 'localhost'
default['piwik']['config']['database']['port'] = '3306'
default['piwik']['config']['database']['username'] = 'piwik'
default['piwik']['config']['database']['password'] = '' # override_attribute in role!
default['piwik']['config']['database']['dbname'] = 'piwik'
default['piwik']['config']['database']['adapter'] = 'PDO_MYSQL'
default['piwik']['config']['database']['tables_prefix'] = 'piwik_'
default['piwik']['config']['database']['charset'] = 'utf8'
