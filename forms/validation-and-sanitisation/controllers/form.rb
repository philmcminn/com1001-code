get "/form" do
  @field1 = params["field1"]
  @field2 = params["field2"]

  @form_was_submitted = !@field1.nil?

  @submission_error = nil
  @field1_error = nil
  @field2_error = nil

  if @form_was_submitted
    # sanitize the values by removing whitespace
    @field1.strip!
    @field2.strip!

    # now proceed to validation
    @field1_error = "Please enter a value" if @field1.empty?
    @field2_error = "Please enter a value" if @field2.empty?
    @submission_error = "Please correct the errors below" unless @field1_error.nil? && @field2_error.nil?
  end

  erb :form
end
