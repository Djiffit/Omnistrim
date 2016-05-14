require 'rails_helper'
require 'helpers'

describe "society functionality" do
  def sign_in(credentials)
    visit '/signin'
    fill_in('username', with: credentials[:username])
    fill_in('password', with: credentials[:password])
    click_button('Log in')
  end

  before :each do
    sign_in(username: "Pekka", password: "pekka")
  end

  it 'creates a new society' do
    visit '/societies/new'
    fill_in('nameS', with: 'Pepperoni')
    fill_in('abbreviation', with: 'fed')
    fill_in('description', with: 'Prkl desu senpai maga ongo nigomaina')
    click_button('streamS')
    click_link('MANvsGAME', match: :first)
    click_button('Create')
    expect(page).to have_content('Society was successfully created.')
  end

  it 'Society is joinable after creation' do
    visit '/societies/new'
    fill_in('nameS', with: 'Pepperoni')
    fill_in('abbreviation', with: 'fed')
    fill_in('description', with: 'Prkl desu senpai maga ongo nigomaina')
    click_button('streamS')
    click_link('MANvsGAME', match: :first)
    click_button('Create')
    visit '/signout'
    FactoryGirl.create(:user2)
    sign_in(username:"Pekkaa", password:"pekka")
    visit '/societies/'
    click_link('Show')
    click_button('Join this Society')
    expect(page).to have_content('Membership was successfully created.')
  end

end
