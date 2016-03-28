require "rails_helper"
require "payments_helper"
require "upload_helper"
require "login_helper"

Capybara.default_driver = :rack_test
RSpec.configure do |config|
  config.include Paperclip::Shoulda::Matchers
  config.include ActionDispatch::TestProcess
  
  config.before(:suite) do
    DatabaseCleaner.clean_with(:transaction)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :transaction
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
  end
end
