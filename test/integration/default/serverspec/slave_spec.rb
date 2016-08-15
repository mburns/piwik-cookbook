# encoding: UTF-8
# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe package('php5') do
  it { should be_installed }
end

describe file('/var/www/piwik/config/config.ini.php') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'www-data' }
  it { should be_grouped_into 'www-data' }
  its(:content) { should match /3306/ }
  # its(:content) { should match /piwik/ }
  its(:content) { should match /piwik_/ }
  its(:content) { should match /utf8/ }
end
