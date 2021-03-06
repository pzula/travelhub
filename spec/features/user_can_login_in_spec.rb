require 'spec_helper'

describe 'User can sign in' do

  it 'can login in' do
    visit root_path
    click_on "Login with Twitter"
    expect(page).not_to have_content "Login"
    expect(page).to have_content "Logout"
    expect(page).to have_content "Signed in!"
  end

  it 'can sign out' do
    visit root_path
    click_on "Login with Twitter"
    click_on "Logout"
    # expect(page).to have_content "Login with Twitter"
    expect(page).not_to have_content "Logout"
    expect(page).to have_content "Signed out!"
  end
end

describe 'User directed to dashboard' do

  it 'sees most recent trip' do
    pending
    visit root_path
    click_on "Login with Twitter"
    Trip.create!(name: "The Highlands",
            description: "To get some food",
            starts_on: Date.today,
            ends_on: Date.today.next_month(1),
            user_id: User.last.id)
    visit dashboard_path
    expect(page).to have_content(User.last.trips.last.name)
  end
end
