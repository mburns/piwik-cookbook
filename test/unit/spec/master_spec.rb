require 'chefspec'
require_relative 'spec_helper'

describe 'piwik::master' do
  before { stub_resources }

  let(:chef_run) { ChefSpec::SoloRunner(step_into: ['cron']).converge(described_recipe) }

  it 'creates hourly_piwik_archive cron' do
    expect(chef_run).to render_file('/etc/crontab/hourly_piwik_archive')
  end
end
