require 'rails_helper'

RSpec.describe 'the bars index page' do
  it 'shows the name of each bar in the system' do
    chasers = Bar.create!(name: 'Chasers', specials: true, established: 2000, location: 'Lake Zurich')
    sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')

    visit "/bars"
# save_and_open_page
    expect(page).to have_content(sideouts.name)
  end

  it 'orders the bars by most recently created first' do
    sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
    chasers = Bar.create!(name: 'Chasers', specials: true, established: 2000, location: 'Lake Zurich')

    visit "/bars"

    within '#bar-0' do
      expect(page).to have_content("Chasers")
    end

    within '#bar-1' do
      expect(page).to have_content("Sideouts")
    end
  end

    it 'links to bars index' do
      sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
      beer = sideouts.drinks.create!(name: 'Beer', quantity: 10000, alcohol: true)

      visit "/drinks"
      click_on "Bars"

      expect(current_path).to eq("/bars")
  end

  it 'has a link next to every bar to update it' do
    sideouts = Bar.create!(name: 'Sideouts', specials: false, established: 1970, location: 'Island Lake')
    chasers = Bar.create!(name: 'Chasers', specials: true, established: 2000, location: 'Lake Zurich')

    visit '/bars'
    click_on "Edit #{sideouts.name}"

    expect(current_path).to eq("/bars/#{sideouts.id}/edit")
  end
end
