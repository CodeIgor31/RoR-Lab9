# frozen_string_literal: true

require_relative 'spec_helper'
require_relative 'rails_helper'
require 'selenium-webdriver'

# testing PalindromsController
RSpec.describe PalindromsController, type: :controller do
  context 'res_array function check' do
    it 'returns correct array' do
      expect(PalindromsController.result_array(11)).to eq([0, 1, 2, 3, 11])
      expect(PalindromsController.result_array(0)).to eq([0])
      expect(PalindromsController.result_array(-1)).to eq([])
    end
  end

  describe 'GET index' do
    context 'check index(main) page' do
      it 'has a 200 status code' do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end
end

RSpec.describe PalindromsController, type: :request do
  context 'notice message test' do
    it 'return notice message' do
      get '/palindroms/result.json?num=11'
      expect(assigns(:number)).to eq(11)
    end
  end
end

RSpec.describe PalindromsController do
  include RSpec::Expectations
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = 'http://localhost:3000/'
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
  end

  it 'check url of page' do
    @driver.get(@base_url)
    expect(@driver.current_url).to eq('http://localhost:3000/')
  end

  it 'show alert message about negative error' do
    @driver.get(@base_url)

    @num_field = @driver.find_element(id: 'num').send_keys(-1)
    @btn = @driver.find_element(id: 'btn').click

    alert = @driver.switch_to.alert
    @alert_text = alert.text
    alert.accept

    expect(@alert_text).to eq('Numbers >= 0')
  end

  it 'should give an answer' do
    @driver.get(@base_url)
    @driver.find_element(:id, 'num').send_keys '11'
    @driver.find_element(:id, 'btn').click
    verify { expect((@driver.find_element(:xpath, '//*[@id="counter"]').text)).to eq('Их количество: 5') }
  end

  def verify
    yield
  rescue ExpectationNotMetError => e
    @verification_errors << e
  end
end
