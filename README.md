# Introduction

Welcome. This repository contains code examples to support the lecture material
and practical sessions to support the Spring Semester of the COM1001 module
"Introduction to Software Engineering" at the University of Sheffield.

The lecture content of the Spring Semester focuses on Web Application
Development and Testing using [Ruby](https://www.ruby-lang.org/) and a framework
called [Sinatra](http://sinatrarb.com/). We will be learning
[RSpec](https://rspec.info/) to write tests. We will also be using other
technologies along the way, including
[Capybara](https://teamcapybara.github.io/capybara/) to automatically drive our
web applications for testing; [SQLite](https://www.sqlite.org/) as a backend
database, and [Sequel](https://sequel.jeremyevans.net/) – an Object-Relational
Mapping framework.

# Setup

The preferred development platform for this module is
[Codio](https://www.codio.com/), which you will have encountered in the Autumn
Semester. The first lecture of the Spring will show you how to get everything
setup.

If you don't like developing with Codio, there are two options available to you.
First, you can develop everything on your own machine. However, this means you
installing Ruby and getting everything working yourself, as we are unable to
provide support for students' individual machines. While this tends to be
relatively easy on Linux on Mac machines, Windows users typically encounter more
problems. Also, you may encounter problems with other team members who do prefer
to use Codio. 

The second option may be more preferable – where you SSH into your Codio box
from your text editor on your machine. This gives you the best of both worlds
– the use of your preferred development environment on your own machine, but
with the ease of Ruby being set up for you on Codio, and you essentially using
the same platform as everyone else. However, you will need to navigate the
instructions for doing this yourself. See
https://docs.codio.com/project/ide/boxes/#ssh-and-code-access-ssh-into-your-box
Instructions for your text editor vary of course, here are some useful pointers
for VS Code: https://code.visualstudio.com/docs/remote/ssh

# Cloning the Repository

To clone the repository you will need to issue the following command:

``git clone git@github.com:philmcminn/com1001-code.git``