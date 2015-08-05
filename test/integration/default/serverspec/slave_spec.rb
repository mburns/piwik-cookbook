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
end
