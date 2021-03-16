get "/" do
  redirect "/login" unless session[:logged_in]
  erb :index
end

get "/login" do
  @user = User.new
  erb :login
end

post "/login" do
  @user = User.new
  @user.load(params)
  @error = nil

  if @user.valid?
    if @user.exist?
      session[:logged_in] = true
      redirect "/"
    else
      @error = "Username/Password combination incorrect"
    end
  else
    @error = "Please correct the information below"
  end

  erb :login
end

get "/logout" do
  session.clear
  erb :logout
end
