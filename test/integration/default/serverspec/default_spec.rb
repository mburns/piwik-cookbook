
# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe package('php5') do
  it { should be_installed }
end

describe file('/etc/nginx/sites-available/piwik') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) { should match /unix:\/tmp\/.php-fcgi-socket/ }
  its(:content) { should match /\/var\/www/ }
end

describe file('/etc/nginx/sites-enabled/piwik') do
  it { should be_linked_to '/etc/nginx/sites-available/piwik' }
end

describe file('/etc/php5/cgi/php.ini') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) { should match /128M/ }
end

describe file('/var/chef/cache/piwik-1.5.1.tar.gz') do
  it { should be_file }
end

describe file('/var/www') do
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'www-data' }
end

describe file('/var/www/piwik/CHANGELOG.md') do
  it { should be_file }
  its(:content) { should match /1.5.1/ }
end

describe file('/var/www/piwik/VERSION') do
  it { should be_file }
  its(:content) { should match /1.5.1/ }
end
