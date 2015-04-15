get '/' do

  erb :index

end

post '/signup' do

  redirect('/profile')

end

post '/login' do

  redirect('/profile')

end

get '/profile' do

  erb :profile

end

post '/tweet' do

  redirect('/profile')

end

get '/users' do

  erb :users

end

get '/user/:id' do

  erb :user

end


