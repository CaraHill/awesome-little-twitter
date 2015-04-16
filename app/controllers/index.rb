enable :sessions

get '/' do # Homepage

  erb :index

end

post '/signup' do # Handles signup form
  user = User.new(full_name: params[:full_name], username: params[:username], email: params[:email] , password: params[:password])
  if user.save
    redirect('/profile')
  else
    redirect('/')
  end

end

post '/login' do # Handles login form

  redirect('/profile')

end

get '/profile' do # Displays users personal profile

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


