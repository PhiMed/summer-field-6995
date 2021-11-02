require 'rails_helper'

RSpec.describe 'the movie show page' do

  it 'lists the movie attributes' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')

    visit "/movies/#{ark.id}"

    expect(page).to have_content(ark.title)
    expect(page).to have_content(ark.creation_year)
    expect(page).to have_content(ark.genre)

  end

  it 'lists actors in the movie, youngest to oldest' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    actor_1 = Actor.create!(name: 'Harrison Ford', age: 42)
    actor_2 = Actor.create!(name: 'Miriam', age: 34)
    ActorMovie.create(actor_id: actor_1.id, movie_id: ark.id)
    ActorMovie.create(actor_id: actor_2.id, movie_id: ark.id)

    visit "/movies/#{ark.id}"

    expect(page).to have_content(actor_1.name)
    expect(page).to have_content(actor_2.name)
    expect(actor_2.name).to appear_before(actor_1.name)
  end

  it 'lists average actors age' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    actor_1 = Actor.create!(name: 'Harrison Ford', age: 42)
    actor_2 = Actor.create!(name: 'Miriam', age: 34)
    ActorMovie.create(actor_id: actor_1.id, movie_id: ark.id)
    ActorMovie.create(actor_id: actor_2.id, movie_id: ark.id)

    visit "/movies/#{ark.id}"

    expect(page).to have_content(ark.average_actor_age)
  end

  it 'can add an actor to the movie' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    actor_1 = Actor.create!(name: 'Harrison Ford', age: 42)
    actor_2 = Actor.create!(name: 'Miriam', age: 34)
    actor_3 = Actor.create!(name: 'Caroline', age: 34)
    ActorMovie.create(actor_id: actor_1.id, movie_id: ark.id)
    ActorMovie.create(actor_id: actor_2.id, movie_id: ark.id)

    visit "/movies/#{ark.id}"
    fill_in('Name', with: 'Caroline')
    click_button('Add actor')
    expect(current_path).to eq("/movies/#{ark.id}")
    expect(page).to have_content("Caroline")

  end



end
