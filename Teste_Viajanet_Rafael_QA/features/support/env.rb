require 'capybara/cucumber'
#require 'webdrivers'
require 'selenium-webdriver'
require 'site_prism'



Capybara.configure do |config|
    config.default_driver = :selenium_chrome

    config.app_host = 'https://www.viajanet.com.br/'
    config.default_max_wait_time = 20
    Selenium::WebDriver.logger.level = :error
end




