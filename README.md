# README

Yet another FFXIV mod website. Unlike other websites, this one is open source - and published under the GNU Affero GPL Version 3 license.

Very early in development, nothing really works yet! Please bear with me.

## Objectives

My main rationale for creating another mod website is because there are currently none that fulfil a list of criteria I have:

1. Have reasonable governance and moderation - this of course isn't a website issue but instead an issue with the people running it.

2. Have a fuzzy search function that actually works, as well as a tag system that actually works.

3. Doesn't sacrifice form over function with fancy animations and such that make the site feel worse to use in practise. That being said, I'll need to optimise how I use all of these Carbon web components at some point.

There are a few features I don't plan to implement simply due to past precedence with other modding sites - the most prominent being comments. However, being AGPL and having a (so far) fairly simple codebase, anyone who wishes to implement these can simply fork it.

## Build

To host the Materia Connect server locally, you must have PostgreSQL installed and running as a service. The Rails application uses the default ports. Without editing these parts of the code to use other systems you must also have Google API keys stored in `config/local_env.yml`, and a file containing your Google Cloud Storage configuration stored in `config/secrets/materia.json`.

With Ruby 3.1.2 installed (preferably through `rbenv` or similar) and with the previous requirements fulfilled, you can simply run `bundle install` to install required gems, `rake db:migrate` to add the required tables and columns to your Postgres database, `rake db:seed` to fill the development database with example data, and finally `bin/rails server` to launch the server.
