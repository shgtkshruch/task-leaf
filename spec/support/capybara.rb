require 'capybara/rspec'
require 'selenium-webdriver'

Capybara.configure do |capybara_config|
  capybara_config.default_driver = :chrome_headless
  capybara_config.default_max_wait_time = 10
end

Capybara.register_driver :chrome_headless do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--window-size=1400,1400')
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :chrome_headless
