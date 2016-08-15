# encoding: UTF-8
# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe cron do
  it { should have_entry '* * * 12 * /var/www/piwik/misc/cron/archive.sh > /dev/null' }
end
