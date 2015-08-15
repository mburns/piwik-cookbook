#
# Cookbook Name:: test
# Recipe:: default
#
# License:: Apache License, Version 2.0
#

node.set['piwik']['config']['superuser']['login'] = 'batman'
node.set['piwik']['config']['superuser']['password'] = 'hunter2'
node.set['piwik']['config']['superuser']['email'] = 'admin@example.com'
node.set['piwik']['config']['superuser']['salt'] = ''

node.set['piwik']['config']['database']['password'] = 'hunter2'

include_recipe 'piwik'
