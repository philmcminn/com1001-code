get "/search" do
  @club_search = params.fetch("club_search", "").strip

  @players = if @club_search.empty?
               Player.all
             else
               Player.where(Sequel.like(:club, "%#{@club_search}%"))
             end

  erb :search
end

get "/add" do
  @player = Player.new
  @errors = Set.new
  erb :add
end

post "/add" do
  @player = Player.new
  @player.load(params)
  @player.sanitize
  @errors = @player.validate

  if @errors.size.zero?
    @player.save
    redirect "/search"
  end

  erb :add
end

get "/edit" do
  id = params["id"]
  @player = Player[id] if Player.id_exists?(id)
  @errors = Set.new
  erb :edit
end

post "/edit" do
  id = params["id"]

  if Player.id_exists?(id)
    @player = Player[id]
    @player.load(params)
    @player.sanitize
    @errors = @player.validate

    if @errors.size.zero?
      @player.save_changes
      redirect "/search"
    end
  end

  erb :edit
end

post "/delete" do
  id = params["id"]

  if Player.id_exists?(id)
    player = Player[id]
    player.delete
    redirect "/search"
  end

  erb :delete
end
