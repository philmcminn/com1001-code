get "/add" do
  @player = Player.new
  @errors = Set.new
  erb :add
end

post "/add" do
  @player = Player.new
  @player.load(params)

  if @player.valid?
    @player.save
    redirect "/search"
  end

  erb :add
end
