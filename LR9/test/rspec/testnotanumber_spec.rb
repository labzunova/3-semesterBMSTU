# Generated by Selenium IDE
require 'selenium-webdriver'
require 'json'
describe 'Testnotanumber' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'testnotanumber' do
    @driver.get('http://127.0.0.1:3000/')
    @driver.manage.resize_to(924, 1053)
    @driver.find_element(:id, 'input_form').click
    @driver.find_element(:id, 'sequence').click
    @driver.find_element(:id, 'sequence').send_keys('sdffsdfsf')
    @driver.find_element(:name, 'commit').click
    element = @driver.find_element(:name, 'commit')
    @driver.action.move_to_element(element).perform
    element = @driver.find_element(By.CSS_SELECTOR, 'body')
    @driver.action.move_to_element(element, 0, 0).perform
  end
end