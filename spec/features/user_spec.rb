require 'rails_helper'
require 'helpers'

describe "user creation" do

  it "works with correct parameters" do
    visit '/signup'
    fill_in('username', with: "Juhani")
    fill_in('password', with: "juhani")
    click_button('Create')
    expect(page).to have_content('User was successfully created!')
    visit '/signout'
    expect(page).to have_content('Successfully logged out!')
  end

  it "does not work with incorrect parameters" do
    visit '/signup'
    fill_in('username', with: "Juhani")
    fill_in('password', with: "j")
    click_button('Create')
    expect(page).not_to have_content('User was successfully created!')
  end

end


# - bundle exec rake db:migrate --trace
# - RAILS_ENV=test bundle exec rake db:migrate --trace
# - bundle exec rake db:test:prepare