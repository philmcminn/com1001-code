get "/simple-form" do
  erb :simple_form
end

get "/process-simple-form" do
  @submitted_text_field_value = params["text_field"]
  erb :unescaped_form_submission
end
