#!/usr/bin/env ruby

###############################################################
#                                                             #
# Sinatra wrapper script                                      #
# by Phil McMinn, 2021. Version: 0.2                          #
#                                                             #
# Enable students to start, stop, and use Sinatra more easily #
#                                                             #
###############################################################

require "socket"

CODIO_FILE = ".codio"
DEFAULT_RUBY_FILE = "app.rb"
EMPH_BOLD = "\033[1m"
EMPH_ITALIC = "\033[3m"
EMPH_UNDERLINE = "\033[4m"
EMPH_BLUE = "\033[34m"
EMPH_BROWN = "\033[33m"
EMPH_CYAN = "\033[36m"   
EMPH_END = "\033[0m"     
EMPH_GREEN = "\033[32m"  
EMPH_GREY = "\033[37m"  
EMPH_MAGENTA = "\033[35m"  
EMPH_RED = "\033[31m"    
EMPH_YELLOW = "\033[33m"
HOME_DIR = "/home/codio/"
HOME_DIR_SHORT = "~/"
HR_DOUBLE_CHAR = "="
HR_SINGLE_CHAR = "-"
INFO_CHAR = "*"
OPTION_VERBOSE = "v"
OPTION_BUNDLE_INSTALL = "b"
OPTION_PREFIX = "-"
PORT = 4567
RUBY_EXTENSION = ".rb"
SINATRA_PROCESS = "ruby /usr/local/bin/sinatra"
SLEEP = 0.1
TIMEOUT = 5
WELCOME_MESSAGE = "STARTING SINATRA..."
WORKSPACE_DIR = "#{HOME_DIR}workspace/"

$info_started = false

def centre(str)
  num_spaces = (terminal_width - str.length) / 2
  spaces = " " * num_spaces
  "#{spaces}#{str}"
end

def hostname
  # Prefer the value in Codio"s environment variable...
  hostname = ENV["hostname"]
  return hostname unless hostname.nil?

  # ... but use Ruby's method if for whatever
  # reason the environment variable is not set
  Socket.gethostname
end

def footer
  "#{EMPH_BOLD}#{hr_double}#{EMPH_END}"
end

def format_dir(dir)
  dir.sub(HOME_DIR, HOME_DIR_SHORT)
end

def header
  "\n#{EMPH_BOLD}#{EMPH_GREY}#{hr_double}\n#{centre(WELCOME_MESSAGE)}\n#{hr_single}#{EMPH_END}"
end

def hr_double
  HR_DOUBLE_CHAR * terminal_width
end

def hr_single
  HR_SINGLE_CHAR * terminal_width
end

def info(str, level = 0)
  $info_started = true
  tab = "  " * level
  "#{tab}#{INFO_CHAR} #{str}"
end

def options_arg?(val)
  val.start_with?(OPTION_PREFIX)
end

def running_on_codio?
  ENV["USER"] == "codio"
end

def quit(problem, suggestion = nil)
  puts info("#{EMPH_YELLOW}ABORTING – A serious problem occurred:#{EMPH_END}")
  puts info("#{EMPH_RED}Problem:#{EMPH_END} #{problem}", 1)
  puts info("#{EMPH_GREEN}Suggestion:#{EMPH_END} #{suggestion}", 1) if suggestion
  puts footer
  abort
end

# Check the status of the port we wish to use
def sinatra_port_status
  begin
    TCPSocket.new("localhost", PORT)
  rescue Errno::ECONNREFUSED
    return :refused
  rescue Errno::EBUSY
    return :busy
  rescue Errno::ECONNRESET
    return :reset
  end
  :available
end

def terminal_width
  `/usr/bin/tput cols`.to_i
end

# Write JSON file that controls run and view menus on Codio
def write_codio_file(url = nil)
  preview = "\"No view – Sinatra not running\": \"\""
  preview = %("View": "#{url}") unless url.nil?
  config_contents = <<~JSON
    {
      "commands": {
        "Run": "cd #{WORKSPACE_DIR}{{path}}\\nsinatra -b {{filename}}"
      },
      "preview": {
        #{preview}
      }
    }
  JSON
  File.write("#{WORKSPACE_DIR}#{CODIO_FILE}", config_contents)
end

# Announce the starting of the script
puts header

# Check we"re on Codio, this script is designed to work there only
problem = "This command will only work with Codio"
suggestion = "Use Codio rather than your own machine. There are ways in which you can still make the most " \
             "of your machine while still using Codio - talk to a member of staff if you are not aware of these."
quit(problem, suggestion) unless running_on_codio?

# Check the order of the arguments
if ARGV.length.zero?
  options_arg = nil
  user_ruby_file_arg = nil
elsif ARGV.length == 1
  if options_arg?(ARGV[0])
    options_arg = 0
    user_ruby_file_arg = nil
  else
    options_arg = nil
    user_ruby_file_arg = 0
  end
elsif ARGV.length == 2
  if options_arg?(ARGV[0])
    options_arg = 0
    user_ruby_file_arg = 1
  elsif options_arg?(ARGV[1])
    options_arg = 1
    user_ruby_file_arg = 0
  else
    options_arg = nil
    user_ruby_file_arg = 0
  end
end

# Parse optional arguments
do_bundle_install = false
verbose = false
unless options_arg.nil?
  options = ARGV[options_arg]
  do_bundle_install = options.include?(OPTION_BUNDLE_INSTALL)
  verbose = options.include?(OPTION_VERBOSE)
end

# Check there is a file to run
if user_ruby_file_arg.nil?
  user_ruby_file = DEFAULT_RUBY_FILE
  puts info("No Ruby file supplied at the command line - attempting to use \"#{DEFAULT_RUBY_FILE}\"") if verbose
else
  user_ruby_file = ARGV[user_ruby_file_arg]
end

if !File.exist?(user_ruby_file) && !user_ruby_file.end_with?(RUBY_EXTENSION)
  # try adding the .rb extension
  user_ruby_file = "#{user_ruby_file}#{RUBY_EXTENSION}"
end

if File.exist?(user_ruby_file)
  puts info("Found file \"#{user_ruby_file}\"") if verbose
else
  if user_ruby_file_arg.nil?
    problem = "There is no Ruby file to run."
    suggestion = "Create an \"app.rb\" file in this directory (#{format_dir(Dir.pwd)}), and run the sinatra command again, " \
                 "or, supply a filename like this: \"sinatra file.rb\"."
  else 
    problem = "The file \"#{user_ruby_file}\" does not exist."
    suggestion = "Create the file \"#{user_ruby_file}\" in this directory (#{format_dir(Dir.pwd)}), and run this " \
                 "command again, or, create a file named \"app.rb\" and run the sinatra command with no filename supplied."
  end
  quit(problem, suggestion)
end

# Clear out the arguments, otherwise Sinatra will try to use them
ARGV.clear

# Kill off existing Sinatra process, if there is one
sp_status = sinatra_port_status
unless sp_status == :refused
  puts info("Another process is running on port #{PORT}...") if verbose

  # find other process
  this_pid = Process.pid
  killed_other_sinatra = false
  puts info("Attempting to find other Sinatra process (this process ID is #{this_pid})", 1) if verbose
  `ps -xhopid,cmd`.split("\n").each do |process_line|
    match = process_line.match(/^\s*(?<pid>\S+)\s+(?<cmd>.+)$/)
    # ensure we don"t kill this process...
    next unless this_pid != match[:pid].to_i

    # ensure the proess was started by this script
    next unless match[:cmd].start_with?(SINATRA_PROCESS)

    puts info("Killing process #{match[:pid]}", 2) if verbose
    system("kill #{match[:pid]}")
    killed_other_sinatra = true
  end
  unless killed_other_sinatra
    puts info("No other process found emanating from this script on port #{PORT}", 2) if verbose
    problem = "Another process is running on port #{PORT} needed by Sinatra."
    suggestion = "Unless you know what this process is, try restarting the box (Project->Restart Box)."
    quit(problem, suggestion)
  end

  puts info("Waiting for process to shutdown...", 2) if verbose
  timeout = Time.now + TIMEOUT
  until (sp_status == :refused) || (Time.now > timeout)
    latest_status = sinatra_port_status
    if sp_status == latest_status
      sleep SLEEP
    else
      sp_status = latest_status
      puts info("Port #{PORT} status: #{sp_status}", 3) if verbose
    end
  end
  if sp_status == :refused
    puts info("... done", 2) if verbose
  else
    problem = "Another process is running on port #{PORT} needed by Sinatra, and it could not be shut down."
    suggestion = "Unless you know what this process is, try restarting the box (Project->Restart Box)."
    quit(problem, suggestion)
  end
end

# Do a bundle install, if request and there's a Gemfile in this directory
if do_bundle_install
  if File.file?("Gemfile")
    puts info("Running bundler...")
    system("bundle install")
  elsif verbose
    puts info("Options requested to run bundler, but there is no local Gemfile.")
  end
elsif verbose
  puts info("Option to run bundler not set, so no gems installed.")
end

# Include user's Sinatra code
require_relative "#{Dir.pwd}/#{user_ruby_file}"

# Configure Sinatra for Codio use
set :bind, "0.0.0.0"
set :port, PORT

# Figure out entry URL
entry = nil
problem = "Your Sinatra application does not contain any routes."
suggestion = "Add some routes to your Ruby file. See the lectures on how to do this."
quit(problem, suggestion) if Sinatra::Application.routes["GET"].nil?
Sinatra::Application.routes["GET"].each do |route|
  path = route[0].to_s
  entry = path if entry.nil?
  if path == "/"
    entry = path
    break
  end
end

# Set the entry URL to the application
base_url = "https://#{hostname}-#{PORT}.codio.io"
entry_url = "#{base_url}#{entry}"
puts hr_single if $info_started
puts info("This Sinatra application is accessible at: #{EMPH_YELLOW}#{EMPH_UNDERLINE}#{entry_url}#{EMPH_END}")
puts info("#{EMPH_GREEN}Handy tip:#{EMPH_END} don't press CTRL+C until #{EMPH_ITALIC}after#{EMPH_END} you have viewed the ^^^ URL!")
puts footer

# Write .codio file to reflect app is running
write_codio_file(entry_url)

# Run Sinatra application
Sinatra::Application.run!

# Rewrite .codio file to reflect that app no longer running
write_codio_file

puts "#{footer}\n\n"