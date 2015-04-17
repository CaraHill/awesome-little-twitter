enable :sessions

get '/' do # Homepage

  erb :index

end

post '/signup' do # Handles signup form
  user = User.new(full_name: params[:full_name], username: params[:username], email: params[:email] , password: params[:password])
  if user.save
    session[:user_id] = user.id
    redirect('/profile')
  else
    redirect('/')
  end

end

post '/login' do # Handles login form
  if user = User.authenticate(params[:email], params[:password])
    session[:user_id] = user.id
    redirect('/profile')
  else
    redirect '/'
  end
end

get '/profile' do # Displays users personal profile


  @current_user = User.find(session[:user_id])
  @tweet = Tweet.where(user_id: session[:user_id])

  erb :profile

end

post '/bio_form' do # Handles posting of tweet

  user = User.find(session[:user_id])
  @bio = params[:bio]
  user.bio = @bio
  @profile_image = params[:profile_image]
  user.profile_image = @profile_image
  user.save

  redirect('/profile')

end

post '/tweet' do # Handles posting of tweet

  # @tweet = Tweet.create(tweet: params[:tweet])
  @tweet = Tweet.create(tweet: params[:tweet])
  user = User.find(session[:user_id])
  user.tweets << @tweet

  redirect('/profile')

end

get '/users' do # List of all users
  @users = User.all
  erb :users

end

get '/users/:id' do # Displays specific users profile page

  @current_user = User.find_by(id: params[:id])
  @tweet = Tweet.where(user_id: params[:id])
  erb :profile

end

post '/log_out' do
  session.clear
  redirect '/'
end


