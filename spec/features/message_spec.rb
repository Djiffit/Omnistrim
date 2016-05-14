require 'rails_helper'
require 'helpers'

describe "messaging functionality" do

  def sign_in(credentials)
    visit '/signin'
    fill_in('username', with: credentials[:username])
    fill_in('password', with: credentials[:password])
    click_button('Log in')
  end



  it "shows a public message in the chat box" do
    Message.create(content:'Peepee jjeeejee', user_id:FactoryGirl.create(:user).id).save
    visit '/'
    expect(page).to have_content('Peepee jjeeejee')
  end

  it "shows personal messages to the sender and recipient" do
    sign_in(username: 'Pekka', password: 'pekka')
    visit '/'
    Message.create(content:'/w Pekka antoisaa juttua kiva kiva', target_name: 'Pekka', target_user_id:FactoryGirl.create(:user).id , user_id:FactoryGirl.create(:user).id).save
    visit '/'
  end

  it 'messages are shown in logs' do
    Message.create(content:'Peepee jjeeejee', user_id:FactoryGirl.create(:user).id).save
    visit '/logs/all'
    expect(page).to have_content('Peepee jjeeejee')
  end

end
