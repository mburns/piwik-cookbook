require 'chefspec'
require_relative 'spec_helper'

describe 'piwik::slave' do
  before { stub_resources }

  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'restarts php-fastcgi' do
    resource = chef_run.template('/var/www/piwik/config/config.ini.php')
    expect(resource).to notify('service[php-fastcgi]').to(:restart).immediately
  end
end
