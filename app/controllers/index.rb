get '/' do # Homepage

  erb :index

end

post '/signup' do # Handles signup form

  redirect('/profile')

end

post '/login' do # Handles login form

  redirect('/profile')

end

get '/profile' do # Displays users personal profile

  @current_user = User.all.first #TEMPORARY! DELETE WHEN SESSIONS INCLUDED
  # @current_user = User.find(session[:user_id])
  erb :profile

end

post '/tweet' do # Handles posting of tweet

  redirect('/profile')

end

get '/users' do # List of all users

  erb :users

end

get '/user/:id' do # Displays specific users profile page

  erb :user

end


