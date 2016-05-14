require 'rails_helper'
require 'helpers'

describe "messaging functionality" do

  def sign_in(credentials)
    visit '/signin'
    fill_in('username', with: credentials[:username])
    fill_in('password', with: credentials[:password])
    click_button('Log in')
  end

  it "shows personal messages to the sender and recipient" do
    FactoryGirl.create(:user2)
    sign_in(username: 'Pekkaa', password: 'pekka')
    visit '/twitch/lirik'
    click_button('Toggle omnichat')
    fill_in('message[content]', with: '/w Pekkaa testing the wisperings')
    click_button('Send')
    fill_in('message[content]', with: '/w Pekkaa thesting the whisperings')
    click_button('Send')
    wait(15.seconds).for(page).to have_content('testing the')
    expect(page).to have_content('From Pekkaa: testing the wisperings')
    expect(page).to have_content('To Pekkaa: testing the wisperings')
  end

  it "shows a public message in the chat box" do
    visit '/twitch/lirik'
    click_button('Toggle omnichat')
    fill_in('message[content]', with: 'This message is a test message')
    click_button('Send')
    fill_in('message[content]', with: 'This message is a test message')
    click_button('Send')
    expect(page).to have_content('message is a test message')
  end


  it 'shows society messages to society members' do
    visit '/societies/1'
    click_button
  end

end
