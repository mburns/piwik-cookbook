# encoding: UTF-8
# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe package('php5') do
  it { should be_installed }
end

describe file('/var/www') do
  it { should be_directory }
  it { should be_mode 755 }
end
