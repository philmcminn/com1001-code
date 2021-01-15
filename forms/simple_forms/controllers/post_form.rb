get "/post-form" do
  erb :post_form
end

post "/post-form" do
  @form_was_submitted = true

  @field1 = params.fetch("field1", "").strip
  @field2 = params.fetch("field2", "").strip

  @field1_error = @field1.empty? ? "Please enter a value" : nil
  @field2_error = @field2.empty? ? "Please enter a value" : nil
  @submission_error = !@field1_error.nil? || !@field2_error.nil? ? "Please correct the errors below" : nil

  erb :post_form
end
