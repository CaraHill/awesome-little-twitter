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

  @current_user = User.find_by_id(session[:user_id])
  if @current_user
    @own_page = true
    @tweet = Tweet.where(user_id: session[:user_id])
    erb :profile
  else
    redirect '/'
  end

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
  session_user = User.find_by(id: session[:user_id])

  if session_user == @current_user
    @own_page = true
  else
    @own_page = false
  end
  @tweet = Tweet.where(user_id: params[:id])
  erb :profile

end

post '/follow/:id' do
  user_to_follow =
  user = User.find(session[:user_id])

end

get '/feed' do
  @user = User.all
  @feed = Tweet.all
  erb :feed
end

post '/log_out' do
  session.clear
  redirect '/'
end


