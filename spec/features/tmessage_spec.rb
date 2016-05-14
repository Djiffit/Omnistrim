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
    sign_in(username: 'Pekka', password: 'pekka')
    Message.create(content:'Peepee jjeeejee', user_id:FactoryGirl.create(:user).id).save
    visit '/twitch/lirik'
    click_button('Toggle omnichat')
    # fill_in('message[content]', with: 'pepperooni')
    # click_button('Send')
    # click_button('Send')
    # click_button('Send')
    # click_button('Send')
    # click_button('Send')
    # click_button('Send')
    # click_button('Send')
    # click_button('Send')
    expect(page).to have_content('Peepee jjeeejee')
    click_button('Send')
  end

  it "shows personal messages to the sender and recipient" do
    sign_in(username: 'Pekka', password: 'pekka')
    visit '/'
    Message.create(content:'/w Pekka antoisaa juttua kiva kiva', target_name: 'Pekka', target_user_id:FactoryGirl.create(:user).id , user_id:FactoryGirl.create(:user).id).save
    visit '/'
  end

  it 'messages are shown in logs' do
    Message.create(content:'Peepee jjeeejee', user_id:1).save
    visit '/logs/'
    visit '/logs/all'
    save_and_open_page
    expect(page).to have_content('Peepee jjeeejee')
    visit '/logs/Pekka'
    expect(page).to have_content('Peepee jjeeejee')
  end

  it 'shows society logs when a member of one' do
    sign_in(username: 'Pekka', password: 'pekka')
    visit '/societies/new'
    fill_in('nameS', with: 'Pepperoni')
    fill_in('abbreviation', with: 'fed')
    fill_in('description', with: 'Prkl desu senpai maga ongo nigomaina')
    click_button('streamS')
    click_link('MANvsGAME', match: :first)
    click_button('Create')
    Message.create(content:'Nice test message we have here nice very nice', user_id:1, society_id:2).save
    visit '/logs/fed'
    expect(page).to have_content('test message we have here')
    Message.create(content:'Peepee jjeeejee', user_id:1).save
    visit('/signout')
    visit '/logs/fed'
    expect(page).to have_content('Peepee jjeeejee')
  end

end
