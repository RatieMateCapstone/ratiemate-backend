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

