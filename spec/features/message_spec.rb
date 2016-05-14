require 'rails_helper'
require 'helpers'

describe "messaging functionality" do

  def sign_in(credentials)
    visit '/signin'
    fill_in('username', with: credentials[:username])
    fill_in('password', with: credentials[:password])
    click_button('Log in')
  end

  before :each do
    sign_in(username:'Pekkaa', password:'pekka')
  end

  it "shows a public message in the chat box" do
    visit '/'
    fill_in('message[content]', with: 'This message is a test message')
    page.should have_xpath("//input[@value='This message is a test message']")
    click_button('Send')
    save_and_open_page
    wait(10.seconds).for(page).to have_content('is a test message')
    save_and_open_page
  end

end
