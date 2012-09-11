# Git Homepage [![Build Status](https://secure.travis-ci.org/github/gitscm-next.png?branch=master)](http://travis-ci.org/github/gitscm-next)

This is the web application for the [git-scm.com](http://git-scm.com) site.  It is meant to be the
first place that a person new to Git will land and download or learn about the
Git SCM system.

This app is written in Ruby on Rails and deployed on Heroku.

## Setup

You'll need a Ruby environment to run Rails.  First do:

    $ rvm use 1.9.3
    $ bundle install

Then you need to create the database structure:

    $ bundle exec rake db:migrate

Now you'll want to populate the man pages.  You can do so from a local Git
source clone like this:

    $ bundle exec rake local_index

Now you can run the Rails site to take a look.  Specify an UPDATE_TOKEN so you
can use the world's stupidest authentication mechanism:

    $ UPDATE_TOKEN=something bundle exec unicorn_rails

The site should be running on http://localhost:8080

Now you'll probably want some book data.  This is more complicated.  You'll have
to clone the progit sources, run the server and then run the populating rake
task:

    $ git clone git://github.com/progit/progit.git .tmp/progit
    $ UPDATE_TOKEN=something bundle exec rake genbook GITBOOK_DIR=.tmp/progit/ GENLANG=en

That will generate the book content from the markdown and post it to the Rails
server.  If you have the server running elsewhere, you can overwrite the CONTENT_SERVER
environment variable.

## Testing

To run the tests for this project, run:

    $ bundle exec rake test

To run the website for testing purposes, run:

    $ bundle exec unicorn_rails

## Contributing

If you wish to contribute to this website, please fork it on GitHub, push your
change to a named branch, then send me a pull request. If it is a big feature,
you might want to contact me first to make sure it's something that I'll
accept.  If it involves code, please also write tests for it.

## License

This source code for the site is licensed under the MIT, which you can find in
the MIT-LICENSE.txt file.

All graphical assets and are licensed under the 
[Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/).
