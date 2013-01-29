# Dynamoid for Devise

`devise-dynamoid` will let you use [devise](http://github.com/plataformatec/devise) with [Dynamoid](http://github.com/jnunemaker/mongomapper).

`devise-dynamoid` is intended for use with `Rails 3.2.x` and `Devise 2` and above. It may work with earlier versions of devise.

This README only covers `devise-dynamoid` specifics. Make sure to read the [devise README](http://github.com/plataformatec/devise/blob/master/README.rdoc)

## Installation

Add `devise`, `devise-dynamoid` and `dynamoid` gems to your Gemfile (your Rails app Gemfile).

    gem 'dynamoid'
    gem 'devise'
    gem 'devise-dynamoid'

Use bundler to install all required gems in your Rails 3 app

    bundle install

Run the devise install generator, followed by the devise-dynamoid model generator:

    rails generate devise:install
    rails generate dynamoid:devise MODEL

The devise install generator will install an initializer
(`config/inititializer/devise.rb`) which describes ALL Devise's configuration
options and you MUST take a look at it. Maker sure this line exists:

    require 'devise/orm/dynamoid'

NOTE: The model generator should do this automatically.

To add Devise to any of your models using the generator:

    rails generate dynamoid:devise MODEL

Example: create a User model for use with Devise

    rails generate dynamoid:devise User

Read the README for devise at [devise README](http://github.com/plataformatec/devise/blob/master/README.rdoc)

## Test Driven Development - extending this project

To develop on this project using TDD, requires the following setup.
Clone this project into a container folder, fx <code>/projects</code>, so you have fx <code>/projects/mm-devise</code>
In the same container folder clone <code>devise</code> from github

Example:

<pre>git clone http://github.com/macteo/devise-dynamoid.git
git clone http://github.com/plataformatec/devise.git
cd devise-dynamoid
bundle install
rake test</pre>

## Gem install

<pre>$ rake install</pre>

## Gem release (push to RubyGems)

<pre>$ gem push pkg/devise-dynamoid-xxxx.gem</pre>

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Maintainers

*Matteo Gavagnin*

Also made suggestions for a few critical fixes and improvements in the code. Thanks :)

## Bugs and Feedback

For *devise-dynamoid* specific issues, please create an issue on GitHub at: [devise-dynamoid issues](http://github.com/macteo/devise-dynamoid/issues)

## Copyright

Copyright (c) 2013 Matteo Gavagnin. See LICENSE for details.


