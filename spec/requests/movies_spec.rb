require 'rails_helper'

RSpec.describe "Movies", type: :request do
  let(:user) {User.create(
    email: 'test1@example.com',
    password: 'password',
    password_confirmation: 'password',
    username: 'firstuser15'
  )}

    describe "POST /create" do
    it 'saves valid intry into the database' do
      movie = user.movies.create(
        title: 'born again',
        genre: 'action',
        image: 'https://images.unsplash.com/photo-1627465688839-f088954a40a0?auto=format&fit=crop&q=80&w=982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
        rating: 4,
        description: 'Ex Marine who turned his life to the lord has now been called back into action',
        platform: 'https://www.youtube.com/'
      )
      post '/movies' 
      movie = JSON.parse(response.body)

      expect(response).to have_http_status(200) 
      expect(movie.first['title']).to eq('born again')
    end 
  end
    describe "GET /index" do
      it 'returns all the movies' do
        movie_params = {
          movie: {
            title: 'born again',
            genre: 'action',
            image: 'https://images.unsplash.com/photo-1627465688839-f088954a40a0?auto=format&fit=crop&q=80&w=982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
            rating: 4,
            description: 'Ex Marine who turned his life to the lord has now been called back into action',
            platform: 'https://www.youtube.com/',
            user_id: user.id
  
          }
          
        }
        get'/movies', params: movie_params 
        movie = JSON.parse(response.body)
  
        expect(response).to have_http_status(200) 
        movie = Movie.first
        expect(movie.title).to eq('born again')
        
      end
      it 'checks for a title' do
        movie_params = {
          movie: {
            title: nil,
            genre: 'action',
            image: 'https://images.unsplash.com/photo-1627465688839-f088954a40a0?auto=format&fit=crop&q=80&w=982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
            rating: 4,
            description: 'Ex Marine who turned his life to the lord has now been called back into action',
            platform: 'https://www.youtube.com/',
            user_id: user.id
          }
        }
        post '/movies', params: movie_params
        expect(response.status).to eq 422
        movie_error = JSON.parse(response.body)
        expect(movie_error['title']).to include("can't be blank")
      end
      it 'checks for a genre' do
        movie_params = {
          movie: {
            title: 'born again',
            genre: nil,
            image: 'https://images.unsplash.com/photo-1627465688839-f088954a40a0?auto=format&fit=crop&q=80&w=982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
            rating: 4,
            description: 'Ex Marine who turned his life to the lord has now been called back into action',
            platform: 'https://www.youtube.com/',
            user_id: user.id
          }
        }
        post '/movies', params: movie_params
        expect(response.status).to eq 422
        movie_error = JSON.parse(response.body)
        expect(movie_error['genre']).to include("can't be blank")
      end
      it 'checks for a image' do
        movie_params = {
          movie: {
            title: 'born again',
            genre: 'action',
            image: nil,
            trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
            rating: 4,
            description: 'Ex Marine who turned his life to the lord has now been called back into action',
            platform: 'https://www.youtube.com/',
            user_id: user.id
          }
        }
        post '/movies', params: movie_params
        expect(response.status).to eq 422
        movie_error = JSON.parse(response.body)
        expect(movie_error['image']).to include("can't be blank")
      end
      it 'checks for a trailer' do
        movie_params = {
          movie: {
            title: 'born again',
            genre: 'action',
            image: 'https://images.unsplash.com/photo-1627465688839-f088954a40a0?auto=format&fit=crop&q=80&w=982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            trailer: nil,
            rating: 4,
            description: 'Ex Marine who turned his life to the lord has now been called back into action',
            platform: 'https://www.youtube.com/',
            user_id: user.id
          }
        }
        post '/movies', params: movie_params
        expect(response.status).to eq 422
        movie_error = JSON.parse(response.body)
        expect(movie_error['trailer']).to include("can't be blank")
      end
      it 'checks for a rating' do
        movie_params = {
          movie: {
            title: 'born again',
            genre: 'action',
            image: 'https://images.unsplash.com/photo-1627465688839-f088954a40a0?auto=format&fit=crop&q=80&w=982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
            rating: nil,
            description: 'Ex Marine who turned his life to the lord has now been called back into action',
            platform: 'https://www.youtube.com/',
            user_id: user.id
          }
        }
        post '/movies', params: movie_params
        expect(response.status).to eq 422
        movie_error = JSON.parse(response.body)
        expect(movie_error['rating']).to include("can't be blank")
      end
      it 'checks for a description' do
        movie_params = {
          movie: {
            title: 'born again',
            genre: 'action',
            image: 'https://images.unsplash.com/photo-1627465688839-f088954a40a0?auto=format&fit=crop&q=80&w=982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
            rating: 4,
            description: nil,
            platform: 'https://www.youtube.com/',
            user_id: user.id
          }
        }
        post '/movies', params: movie_params
        expect(response.status).to eq 422
        movie_error = JSON.parse(response.body)
        expect(movie_error['description']).to include("can't be blank")
      end
      it 'checks for a platform' do
        movie_params = {
          movie: {
            title: 'born again',
            genre: 'action',
            image: 'https://images.unsplash.com/photo-1627465688839-f088954a40a0?auto=format&fit=crop&q=80&w=982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
            rating: 4,
            description: 'Ex Marine who turned his life to the lord has now been called back into action',
            platform: nil,
            user_id: user.id
          }
        }
        post '/movies', params: movie_params
        expect(response.status).to eq 422
        movie_error = JSON.parse(response.body)
        expect(movie_error['platform']).to include("can't be blank")
      end
      it 'checks for a user_id' do
        movie_params = {
          movie: {
            title: 'born again',
            genre: 'action',
            image: 'https://images.unsplash.com/photo-1627465688839-f088954a40a0?auto=format&fit=crop&q=80&w=982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
            rating: 4,
            description: 'Ex Marine who turned his life to the lord has now been called back into action',
            platform: 'https://www.youtube.com/',
            user_id: nil
          }
        }
        post '/movies', params: movie_params
        expect(response.status).to eq 422
        movie_error = JSON.parse(response.body)
        expect(movie_error['user_id']).to include("can't be blank")
      end
  end
end
