# 1. Introduction

Welcome! This repository contains code examples to support the lecture material
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

### Contents

* [1. Introduction](#1-introduction)
* [2. Getting Started and Cloning the Repository](#2-getting-started-and-cloning-the-repository)
* [3. Which Code Examples are Discussed in Which
  Lectures?](#3-which-examples-are-discussed-in-which-lectures)
* [4. If You Don't Like Codio](#4-if-you-dont-like-codio)
* [5. Problems or Feedback](#5-problems-or-feedback)


# 2. Getting Started and Cloning the Repository

The preferred development platform for this module is
[Codio](https://www.codio.com/), which you will have encountered in the Autumn
Semester. The first lecture of the Spring will show you how to get everything
setup. This lecture is available as a video on
(Blackboard[https://vle.shef.ac.uk]).

### Cloning the Repository

To clone the repository you will need to issue the following command:

``git clone git@github.com:philmcminn/com1001-code.git``

# 3. Which Code Examples are Discussed in Which Lectures?

# 4. If You Don't Like Codio...

If you don't like developing with Codio, then sorry! Codio makes it really easy
for us to provide a standardised environment to students in which we can help
with common problems. This ideal in the current climate.

Nevertheless, if you seriously dislike Codio there are a couple of options
available to you, depending on your level of technical expertise:

### 1. Develop on Your Own Machine (Not Recommended)

First, you can develop everything on your own machine. However, this means you
installing Ruby and getting everything working yourself – we are unable to
provide support for students' individual machines. While getting Ruby set up
tends to be relatively easy on Linux on Mac machines, Windows users typically
encounter more problems. Also, do not forget your team members and your project
who may prefer to use Codio, opening up various possibilities for
incompatibilities and problems. Finally, remember that the team project will be
marked using Codio – so everything needs to work there out of the box.

### 2. SSH into Codio from Your Own Machine (Slightly More Endorsed, But Potentially Tricky to Setup)

The second option may be more preferable – where you SSH into your Codio box
from your text editor/IDE on your own machine. This gives you the best of both
worlds – the use of your preferred development environment, but with the ease of
Ruby already being set up for you on Codio, and you using the same platform as
everyone else. However, you will need to navigate the instructions for doing
this yourself – again, we are unable to provide assistance. See
https://docs.codio.com/project/ide/boxes/#ssh-and-code-access-ssh-into-your-box
Instructions for your text editor/IDE vary of course, depending on what you're
using – here are some useful pointers for VS Code, for example:
https://code.visualstudio.com/docs/remote/ssh.

### 3. Use VSCode on Codio Itself (Pretty Easily Done)

Finally VSCode may be used in a web browser on Codio itself. On Codio, go to
"Tools", then "Install Software". Scroll down the list and select "VSCode".
VSCode is now available in your web browser from your Codio box on port 4000.
The URL depends on your Codio box name. This is the subdomain of your Codio Box
domain, which Codio tells you whenever you start a terminal session. For
example, it tells me that my Codio Box domain is ``north-mister.codio.io``. This
means my box name is ``north-mister``. This means my URL for VSCode, if I
installed it, would be https://north-mister-4000.codio.io. Note that this URL is
essentially the same as the base URL of your web applications launched from
Codio (as discussed in lectures), but using port 4000.

# 5. Problems or Feedback

We welcome feedback including any constructive criticism or positive comments
that you may have.

If you are experiencing problems with using the repository, please contact the
module lecturer that owns it – [Phil McMinn](https://mcminn.io). 

Please note that the teaching team are limited in the help that we can offer on
specific system setups. If you are experiencing significant difficulties, please
use Codio, where we can give you full support if you run into problems. 
