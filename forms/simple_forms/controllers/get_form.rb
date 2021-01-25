get "/get-form" do
  erb :get_form
end

get "/process-get-form" do
  @submitted_text_field_value = params["text_field"]
  erb :escaped_form_submission
end
