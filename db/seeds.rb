user1 = User.where(email: "test1@example.com").first_or_create(username: "firstuser15", password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(username: "seconduser16", password: "password2", password_confirmation: "password2")

movie1 = [
    {
        title: 'born again',
        genre: 'action',
        image: 'https://assets.mycast.io/posters/mcu-daredevil-born-again-series-fan-casting-poster-261961-large.jpg?1669297922',
        trailer: 'https://www.youtube.com/watch?v=V-yt7-DJZyY&ab_channel=Soundridemusic-NoCopyrightMusic',
        rating: 4,
        description: 'Ex Marine who turned his life to the lord has now been called back into action',
        platform: 'Youtube'
    },
]

movie2 = [
    {
        title: 'Fed Up',
        genre: 'comedy',
        image: 'https://images.unsplash.com/photo-1611956425642-d5a8169abd63?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y29tZWR5fGVufDB8fDB8fHww',
        trailer: 'https://www.youtube.com/watch?v=1zNxsEyK4E0&ab_channel=BrokenC-Music',
        rating: 4,
        description: "He's fed up and here's his story ",
        platform: 'https://www.youtube.com/'
    },
]
movie3 = [
    {
        title: 'Whispers Of Decay',
        genre: 'Horror',
        image: 'https://i.scdn.co/image/ab67616d0000b2736f51e35a27850178d6ba9b5d',
        trailer: 'https://www.youtube.com/watch?v=E_Ty9L3P3Ls&list=PLY4oAfouVgHI_DzPRn4ixYibkM03x-QIA&ab_channel=ElysiumAudioLabs',
        rating: 2,
        description: "Masked man hunting people",
        platform: 'https://www.youtube.com/'
    },
]

movie1.each do |movie| 
    user1.movies.create!(movie)
    p "creating #{movie}"
end

movie2.each do |movie| 
    user2.movies.create!(movie)
    p "creating #{movie}"
end

movie3.each do |movie| 
    user2.movies.create!(movie)
    p "creating #{movie}"
end