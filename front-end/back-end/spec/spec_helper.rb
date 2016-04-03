require "rails_helper"
require "payments_helper"
require "upload_helper"
require "login_helper"
require 'coveralls'

Coveralls.wear!

Capybara.default_driver = :rack_test
RSpec.configure do |config|
  config.include Paperclip::Shoulda::Matchers
  config.include ActionDispatch::TestProcess

  config.before(:suite) do
    DatabaseCleaner[:active_record].clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.after(:each) do
    Dir["#{Rails.root}/public/system/tracks/files/**/**/*.*"].each do |file|
      File.delete(file)
    end
    Dir["#{Rails.root}/public/system/tracks/images/**/**/*.*"].each do |file|
      File.delete(file)
    end
  end
end
