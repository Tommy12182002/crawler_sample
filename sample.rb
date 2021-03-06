$:.unshift File.expand_path(File.dirname(__FILE__))
require 'capybara/dsl'
require 'site_prism'
require 'crawler'
require 'selenium-webdriver'

# Use chromedriver with capybara.
# If you don't want use headless mode, remove desired_capabilities.
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app,
    browser: :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      chrome_options: {
        args: %w(headless disable-gpu window-size=1680,1050),
      }
    )
  )
end

# Using selenium, not rack test.
Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver        = :selenium
end

p '検索ワードを入力：'
input_word = gets.chomp!

page = Crawler::GooglePage.new
page.load
page.search_input.set(input_word)
page.search_button.click

page.search_results.each do |result|
  puts result.text
end
