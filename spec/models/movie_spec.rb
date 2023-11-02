require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:user) { User.create(
    email: 'test1@example.com',
    password: 'password',
    password_confirmation: 'password',
    username: 'firstuser15'
    )
  }
  it 'should validate title'do
    movie = user.movies.create(
      title: nil,
      genre: 'action',
      image: 'https://images.unsplash.com/photo-1627465688839-f088954a40a0?auto=format&fit=crop&q=80&w=982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
      rating: 4,
      description: 'Ex Marine who turned his life to the lord has now been called back into action',
      platform: 'https://www.youtube.com/'
    )
    p user.errors
    expect(movie.errors[:title]).to include "can't be blank"
  end
  it 'should validate genre'do
    movie = user.movies.create(
      title: 'born again',
      genre: nil,
      image: 'https://images.unsplash.com/photo-1627465688839-f088954a40a0?auto=format&fit=crop&q=80&w=982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
      rating: 4,
      description: 'Ex Marine who turned his life to the lord has now been called back into action',
      platform: 'https://www.youtube.com/'
    )
    expect(movie.errors[:genre]).to include "can't be blank"
  end
  it 'should validate image'do
    movie = user.movies.create(
      title: 'born again',
      genre: 'action',
      image: nil,
      trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
      rating: 4,
      description: 'Ex Marine who turned his life to the lord has now been called back into action',
      platform: 'https://www.youtube.com/'
    )
    expect(movie.errors[:image]).to include "can't be blank"
  end
  it 'should validate trailer'do
    movie = user.movies.create(
      title: 'born again',
      genre: 'action',
      image: 'https://images.unsplash.com/photo-1627465688839-f088954a40a0?auto=format&fit=crop&q=80&w=982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      trailer: nil,
      rating: 4,
      description: 'Ex Marine who turned his life to the lord has now been called back into action',
      platform: 'https://www.youtube.com/'
    )
    expect(movie.errors[:trailer]).to include "can't be blank"
  end
  it 'should validate rating'do
    movie = user.movies.create(
      title: 'born again',
      genre: 'action',
      image: 'https://images.unsplash.com/photo-1627465688839-f088954a40a0?auto=format&fit=crop&q=80&w=982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
      rating: nil,
      description: 'Ex Marine who turned his life to the lord has now been called back into action',
      platform: 'https://www.youtube.com/'
    )
    expect(movie.errors[:rating]).to include "can't be blank"
  end
    it 'should validate description'do
      movie = user.movies.create(
        title: 'born again',
        genre: 'action',
        image: 'https://images.unsplash.com/photo-1627465688839-f088954a40a0?auto=format&fit=crop&q=80&w=982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
        rating: 4,
        description: nil,
        platform: 'https://www.youtube.com/'
    )
    expect(movie.errors[:description]).to include "can't be blank"
    end
  it 'should validate platform'do
    movie = user.movies.create(
      title: 'born again',
      genre: 'action',
      image: 'https://images.unsplash.com/photo-1627465688839-f088954a40a0?auto=format&fit=crop&q=80&w=982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
      rating: 4,
      description: 'Ex Marine who turned his life to the lord has now been called back into action',
      platform: nil
  )
  expect(movie.errors[:platform]).to include "can't be blank"
  end
end
