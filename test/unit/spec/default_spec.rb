require 'chefspec'
require_relative 'spec_helper'

describe 'piwik::default' do
  before { stub_resources }

  let(:chef_run) { ChefSpec::SoloRunner(step_into: ['iptables', 'logrotate', 'runit']).converge(described_recipe) }

  it 'enables piwik virtualhost' do
    expect(chef_run).to run_bash('enable piwik site')
  end

  it 'includes the `logrotate` recipe' do
    expect(chef_run).to include_recipe('logrotate::default')
  end

  it 'configures nginx log rotation' do
    expect(chef_run).to logrotate_app_create('nginx')
  end

  it 'includes the `runit` recipe' do
    expect(chef_run).to include_recipe('runit::default')
  end

  it 'configures piwik runit service' do
    expect(chef_run).to runit_service_create('piwik')
  end

  it 'includes the `iptables` recipe' do
    expect(chef_run).to include_recipe('iptables::default')
  end

  it 'adds firewall rule for nginx' do
    expect(chef_run).to iptables_rule_rule('iptables_http')
  end
  it 'creates a remote_file of piwik tarball' do
    expect(chef_run).to create_remote_file_if_missing('/var/chef/cache/piwik-1.5.1.tar.gz')
  end

  it 'runs install_piwik script' do
    expect(chef_run).to run_bash('install_piwik')
  end
end
