## Welcome to Ratie Mate!  https://frontend-ratiemate.onrender.com/

Ratie Mate is a movie rating application created by: Tori Calkins, Adrian Ramirez, Ilene Varela-Zul and Roniel Overton.
This appilcation was created to showcase the knowledge and skills acquired throughout our time at LEARN Academy as our final project "Capstone" before we start our interships. Us at Ratie Mate hope that you can view our app and be inspired to create your own web appilcation at some point.


## Features
- Welcome page.

- User can sign up and sign in.

- Logged in, user can search for movie in movie data base.

- User can create their own movie to rate.

- Created movie can be stored in its own "Your Movies" page.

- User can update information about the created movie.

- User can also delete unwanted movie.


## Running this app locally 
live version 

Ratie Mate Frontend: https://github.com/RatieMateCapstone/ratiemate-frontend

Ratie Mate Backend: https://github.com/RatieMateCapstone/ratiemate-backend



- cd into desktop or perferred directory.

- Clone Ratie Mate repo into terminal from provided links: $ git clone <link>.

- install yarn dependencies.

- Run a rails bundle.

- Run rails db:setup for database.

- Run rails start or s, first for backend.

- Run yarn start for frontend, choose local host 3001.

- Enjoy!

## Rails API
- The API will cover the M & C: model and controller
- Generating a resource will create model, view, controller, and routes.
- However, we will use React for the views.

## Process to create and test the API functionality
1. Create an empty github repo √
2. Create a local rails application √
3. Connected the github repo and the local rails app √
4. Add all the applicable dependencies √
5. Create a resource √
6. Add seeds √
7. Enable CORS √

## Create a resource
- $ `rails generate resource Movies title:string genre:string image:string trailer:string rating:integer description:text platform:string`
- $ `rails db: migrate`

## Rspec testing suite
- To see all files: $ `rspec spec`
- To specify one file, give the file path: $ `rspec spec/requests/movies_spec.rb`


Implementing Device Dependencies

 Devise created a user table but with different attributes. user name not showing that was made with devise. Will check on frontend side when applicable if user:name shows in form.


 ** Update and delete 
 use rails routes -E for info on gow to write the url.

 need to create variable to  indicate which movie get updated 
 <first_movie = Movie.first>

 Call on movie params to change attributes for movie.
       movie_params = {
        movie: {
          title: 'born yesterday', <---- previous name 'born again'
          genre: 'action',
          image: 'https://images.unsplash.com/photo-1627465688839-f088954a40a0?auto=format&fit=crop&q=80&w=982&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
          rating: 4,
          description: 'Ex Marine who turned his life to the lord has now been called back into action',
          platform: 'https://www.youtube.com/',
          user_id: user.id
        }   
      }

With string interpoation call on variable.id for url routes  <patch "/movies/#{first_movie.id}", params: movie_params> 

### Enable CORS
- Add `rack-cors` gem to the Gemfile
- Create a cors.rb file in config/initializers directory
- Add the following code to that file
```rb
# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.