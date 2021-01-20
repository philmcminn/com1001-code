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

### Contents of this README file

1. [Introduction](#1-introduction)
2. [Getting Started and Cloning the Repository](#2-getting-started-and-cloning-the-repository)
3. [Which Code Examples are Discussed in Which Lectures?](#3-which-examples-are-discussed-in-which-lectures)
4. [If You Don't Like Codio](#4-if-you-dont-like-codio)
5. [Problems or Feedback](#5-problems-or-feedback)


# 2. Getting Started and Cloning the Repository

The preferred development platform for this module is
[Codio](https://www.codio.com/), which you will have encountered in the Autumn
Semester. The first lecture of the Spring will show you how to get everything
setup. This lecture is available as a video on
[Blackboard](https://vle.shef.ac.uk).

### Cloning the Repository

To clone the repository you will need to issue the following command:

``git clone git@github.com:philmcminn/com1001-code.git``

### Running an Example

To run an example you'll need to change to the directory where it exists as a
Ruby file. You'll need to ensure the appropriate gems are installed. Each
directory contains a ``GemFile`` so it is easy for you to ensure this using
[Bundler](https://bundler.io). Bundler is already installed on Codio, so you
just need to issue a ``bundle install`` command in the terminal in the
appropriate directory. If you're using your own machine, which is _not
recommended_ ([see here as to
why](#1-develop-on-your-own-machine-not-recommended)), you'll need to install it
first, if you haven't already. Unless the file forms a part of an overall
application, you should be able to run it by issuing a ``ruby ...`` command at
the terminal (where the dots are the Ruby file name). It should be clear from
the explanations in lectures and looking at the code itself which files are
meant to be run and which ones are not.

# 3. Which Code Examples are Discussed in Which Lectures?

The lectures reference the code examples in this repository. The first time an
example is mentioned, its path in the repository will be listed under the code
snippet of the example on the slide. 

If you're struggling to find the lecture in which an example appears, I've provided the
table below to help you out:

| Examples Directory  | Lecture(s)                                                                                                 | Week          |
| ------------------- | -----------------------------------------------------------------------------------------------------------| ------------- |
| ``basics/``         | &bullet; _An Introduction to Web Application Development – Sinatra Basics: Verbs, Routes, and Blocks_      | TBA           |
| ``controllers/``    | &bullet; _Web Application Architecture – The Model View Controller (MVC) Design Pattern_                   | TBA           |
| ``cookies/``        | &bullet; _Cookies_                                                                                         | TBA           |
| ``databases/``      | &bullet; _Introduction to Relational Databases and SQL_                                                    | TBA           |
| ``debugging/``      | &bullet; _Yesterday My Program Worked. Today It Does Not! Why?_ <br /> &bullet; _These are Testing Times!_ | TBA <br/> TBA |
| ``forms/``          | &bullet; _Forms, GET and POST_                                                                             | TBA           |
| ``models/``         | &bullet; _Models in Sinatra_                                                                               | TBA           |
| ``orm/``            | &bullet; _Interacting with a Database Using Ruby: Object-Relational Mapping_                               | TBA           |
| ``routes/``         | &bullet; _Advanced Routes_                                                                                 | TBA           |
| ``ruby/``           | &bullet; _Ruby Blocks_ <br /> &bullet; _Interacting with a Database using Ruby_ (see slides on Hashes)     | TBA <br/> TBA |
| ``security/``       | &bullet; _Security and Web Applications_                                                                   | TBA           |
| ``sessions/``       | &bullet; _Sessions_                                                                                        | TBA           |
| ``unit_testing/``   | &bullet; _These are Testing Times!_                                                                        | TBA           |
| ``views/``          | &bullet; _The Web Application Front-End_                                                                   | TBA           |

# 4. If You Don't Like Codio...

If you don't like developing with Codio, then sorry! Codio makes it really easy
for us to provide a standardised environment to students in which we can help
with common problems. This ideal in the current pandemic climate, where our
teaching is predominantly being delivered online. 

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
https://docs.codio.com/project/ide/boxes/#ssh-and-code-access-ssh-into-your-box.
Instructions for your text editor/IDE vary of course, depending on what you're
using – here are some useful pointers for
[VSCode](https://code.visualstudio.com), a popular text editor and IDE for many
languages, as an example: https://code.visualstudio.com/docs/remote/ssh.

### 3. Use VSCode on Codio Itself (Pretty Easily Done, if You Followed the Instructions in the First Lecture)

Finally, VSCode may be used in a web browser on Codio itself. Assuming you have
followed in the instructions in the first lecture, on getting everything setup
in Codio, then you will have a Codio box already up and running. In Codio, go to
"Tools", then "Install Software". Scroll down the list and select "VSCode".
VSCode will be now available in your web browser for use with your Codio files.
The URL you need to access it depends on your Codio box name. Your Codio box
name is the subdomain of your Codio Box domain, which Codio reports in the
preamble of every Terminal session that you start. For example, my Terminal
session tells me that my Codio box domain is ``north-mister.codio.io``. This
means my box name is ``north-mister`` (perhaps appropriately). This means my URL
for VSCode, if I installed it, would be https://north-mister-4000.codio.io. Note
that this URL is essentially the same as the Base URL of your web applications
launched from Codio (as discussed in lectures), but using port 4000.

# 5. Problems or Feedback

We welcome feedback including any constructive criticism or positive comments
that you may have.

If you are experiencing problems with using the repository, please contact the
module lecturer – [Phil McMinn](https://mcminn.io). 

Please note that the teaching team are limited in the help that we can offer on
specific system setups. If you are experiencing significant difficulties, please
use Codio, where we can give you full support if you run into problems. 
