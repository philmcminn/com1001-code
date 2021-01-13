LAST_VISITED_PERSISTENT_COOKIE = "last_visited_persistent"
NUM_VISITS_PERSISTENT_COOKIE = "num_visits_persistent"
NUM_VISITS_SESSION_COOKIE = "num_visits_session"
ONE_DAY_IN_MILLISECONDS = 1000 * 60 * 60 * 24

get "/" do
  # read persistent cookies
  last_visited_persistent = request.cookies[LAST_VISITED_PERSISTENT_COOKIE]
  num_visits_persistent = request.cookies.fetch(NUM_VISITS_PERSISTENT_COOKIE, 0).to_i

  # read session cookies
  num_visits_session = request.cookies.fetch(NUM_VISITS_SESSION_COOKIE, 0).to_i

  # set persistent cookies
  response.set_cookie(LAST_VISITED_PERSISTENT_COOKIE,
                      { value: Time.now,
                        expires: Time.now + ONE_DAY_IN_MILLISECONDS })
  response.set_cookie(NUM_VISITS_PERSISTENT_COOKIE,
                      { value: num_visits_persistent + 1,
                        expires: Time.now + ONE_DAY_IN_MILLISECONDS })

  # set session cookies
  response.set_cookie(NUM_VISITS_SESSION_COOKIE, num_visits_session + 1)

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
  response.delete_cookie(LAST_VISITED_PERSISTENT_COOKIE)
  response.delete_cookie(NUM_VISITS_PERSISTENT_COOKIE)
  response.delete_cookie(NUM_VISITS_SESSION_COOKIE)
  erb :delete
end
