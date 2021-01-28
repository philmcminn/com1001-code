get "/add" do
  @player = Player.new
  erb :add
end

post "/add" do
  @player = Player.new
  @player.load(params)

  if @player.valid?
    @player.save_changes
    redirect "/search"
  end

  erb :add
end
