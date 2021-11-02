require 'rails_helper'

RSpec.describe 'the studios index' do

  it 'lists all the studios names' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

    visit "/studios"

    expect(page).to have_content(universal.name)
  end

  it 'lists studios missions' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    shrek = universal.movies.create!(title: 'Shrek', creation_year: 2000, genre: 'Comedy')

    visit "/studios"

    expect(page).to have_content(ark.title)
    expect(page).to have_content(shrek.title)
  end
end
