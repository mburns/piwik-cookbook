require 'chefspec'
require_relative 'spec_helper'

describe 'piwik::master' do
  before { stub_resources }

  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
end
