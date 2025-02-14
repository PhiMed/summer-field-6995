require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many :actor_movies }
    it {should have_many(:actors).through(:actor_movies)}
  end

  it 'lists its actors' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    actor_1 = Actor.create!(name: 'Harrison Ford', age: 42)
    actor_2 = Actor.create!(name: 'Miriam', age: 34)
    ActorMovie.create(actor_id: actor_1.id, movie_id: ark.id)
    ActorMovie.create(actor_id: actor_2.id, movie_id: ark.id)

    expect(ark.actors).to eq([actor_1,actor_2])
  end

  it 'can order its actors youngest to oldest' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    actor_1 = Actor.create!(name: 'Harrison Ford', age: 42)
    actor_2 = Actor.create!(name: 'Miriam', age: 34)
    ActorMovie.create(actor_id: actor_1.id, movie_id: ark.id)
    ActorMovie.create(actor_id: actor_2.id, movie_id: ark.id)

    expect(ark.actors_young_to_old).to eq([actor_2,actor_1])
  end

  it 'lists average actors age' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    actor_1 = Actor.create!(name: 'Harrison Ford', age: 42)
    actor_2 = Actor.create!(name: 'Miriam', age: 34)
    ActorMovie.create(actor_id: actor_1.id, movie_id: ark.id)
    ActorMovie.create(actor_id: actor_2.id, movie_id: ark.id)

    expect(ark.average_actor_age).to eq(38)
  end
end
