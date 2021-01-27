ONE_DAY_IN_SECONDS = 60 * 60 * 24

get "/" do
  # read persistent cookies
  last_visited_persistent = request.cookies["last_visited_persistent"]
  num_visits_persistent = request.cookies.fetch("num_visits_persistent", 0).to_i

  # read session cookies
  num_visits_session = request.cookies.fetch("num_visits_session", 0).to_i

  # set persistent cookies
  response.set_cookie("last_visited_persistent",
                      { value: Time.now,
                        expires: Time.now + ONE_DAY_IN_SECONDS })
  response.set_cookie("num_visits_persistent",
                      { value: num_visits_persistent + 1,
                        expires: Time.now + ONE_DAY_IN_SECONDS })

  # set session cookies
  response.set_cookie("num_visits_session", num_visits_session + 1)

  # convert the cookie values into friendlier formatted strings
  # that can be displayed in the view
  @last_visited = ""
  @total_num_visits = num_visits_persistent
  @session_num_visits = num_visits_session
  if @total_num_visits.positive?
    # parse in the date/time string in the cookie
    last_visited_time = Time.parse(last_visited_persistent)

    # format the date/time
    @last_visited = last_visited_time.strftime("%a %b %d, %I:%M:%S %p")
  end

  erb :index
end

get "/delete" do
  response.delete_cookie("last_visited_persistent")
  response.delete_cookie("num_visits_persistent")
  response.delete_cookie("num_visits_session")
  erb :delete
end
