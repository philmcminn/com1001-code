require "net/http"

def validate_email_address(email_address)
  email_address =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
end

def send_mail(email, subject, body)
  response = Net::HTTP.post_form(URI("http://www.dcs.shef.ac.uk/cgi-intranet/public/FormMail.php"),
                                 "recipients" => email,
                                 "subject" => subject,
                                 "body" => body)
  response.is_a? Net::HTTPSuccess
end

email = nil
until validate_email_address(email)
  puts "Please enter a valid recipient email address:"
  email = gets.chomp
end

puts "Please enter the subject of the email:"
subject = gets.chomp

puts "Please enter your message:"
body = gets.chomp

puts "Sending email..."
if send_mail(email, subject, body)
  puts "Email sent ok."
else
  puts "Send failed."
end
