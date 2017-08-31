require "bundler/setup"
require "block_cypher_client"
require "virtus/matchers/rspec"
require "vcr"
require "webmock"
require "pathname"
require "yaml"
require "pry-byebug"

SPEC_DIR = Pathname.new(File.dirname(__FILE__))
CONFIG_FILE = SPEC_DIR.join("config.yml")
CONFIG = YAML.load_file(CONFIG_FILE).with_indifferent_access

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

VCR.config do |c|
  c.stub_with :webmock
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.filter_sensitive_data('<token>') { CONFIG[:token] }
  c.configure_rspec_metadata!
end
