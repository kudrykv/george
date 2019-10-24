# frozen_string_literal: true

require 'michael/models/configuration.rb'

RSpec.describe Michael::Models::Configuration do
  TEST_DIR = './'
  TEST_CONFIG_FILE = 'testconfig'

  subject(:config) {
    Michael::Models::Configuration
      .new(config_dir: TEST_DIR, config_name: TEST_CONFIG_FILE)
  }

  after(:each) do
    config.nuke
  end

  context 'when the object is created' do
    it 'should set the value' do
      config.set(:key, value: 'value')
      expect(config.fetch(:key)).to eq 'value'
    end

    it 'should set list' do
      config.append('a', 'b', to: :list)
      expect(config.fetch(:list)).to eq %w[a b]
    end

    it 'should remove elem from list' do
      config.append('a', 'b', to: :list)
      # noinspection RubyArgCount
      config.remove('b', from: :list)
      expect(config.fetch(:list)).to eq %w[a]
    end
  end
end
