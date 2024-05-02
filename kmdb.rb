# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Actor.destroy_all 
Movie.destroy_all
Role.destroy_all
Studio.destroy_all 

# Generate models and tables, according to the domain model.
# Created using:
# (1) rails generate model Actor / Movie / Role / Studio
# (2) Migrations edited (added columns)
# (3) rails db:migrate


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

studio = Studio.new
studio["name"] = "Warner Bros."
studio.save

warner = Studio.find_by({"name" => "Warner Bros."})

# Create Batman Begins
batman_begins = Movie.new

batman_begins.title = "Batman Begins"
batman_begins.year_released = 2005
batman_begins.rated = "PG-13"
batman_begins.studio_id = studio.id
batman_begins.save

# Create The Dark Knight
dark_knight = Movie.new

dark_knight.title = "The Dark Knight"
dark_knight.year_released = 2008
dark_knight.rated = "PG-13"
dark_knight.studio_id = studio.id
dark_knight.save

# Create The Dark Knight Rises
dark_knight_rises = Movie.new

dark_knight_rises.title = "The Dark Knight Rises"
dark_knight_rises.year_released = 2012
dark_knight_rises.rated = "PG-13"
dark_knight_rises.studio_id = studio.id
dark_knight_rises.save

## Actors:

# Batman Begins
actor = Actor.new
actor["name"] = "Christian Bale"
actor.save

actor = Actor.new
actor["name"] = "Michael Caine"
actor.save

actor = Actor.new
actor["name"] = "Liam Neeson"
actor.save

actor = Actor.new
actor["name"] = "Katie Holmes"
actor.save

actor = Actor.new
actor["name"] = "Gary Oldman"
actor.save

# The Dark Knight
actor = Actor.new
actor["name"] = "Heath Ledger"
actor.save

actor = Actor.new
actor["name"] = "Aaron Eckhart"
actor.save

actor = Actor.new
actor["name"] = "Maggie Gyllenhaal"
actor.save

# The Dark Knight Rises
actor = Actor.new
actor["name"] = "Tom Hardy"
actor.save

actor = Actor.new
actor["name"] = "Joseph Gordon-Levitt"
actor.save

actor = Actor.new
actor["name"] = "Anne Hathaway"
actor.save


## Roles

# Create the association for movies
batman_begins = Movie.find_by(title: "Batman Begins")
the_dark_knight = Movie.find_by(title: "The Dark Knight")
the_dark_knight_rises = Movie.find_by(title: "The Dark Knight Rises")

# Create the associations for actors
christian_bale = Actor.find_by(name: "Christian Bale")
michael_caine = Actor.find_by(name: "Michael Caine")
liam_neeson = Actor.find_by(name: "Liam Neeson")
katie_holmes = Actor.find_by(name: "Katie Holmes")
gary_oldman = Actor.find_by(name: "Gary Oldman")
heath_ledger = Actor.find_by(name: "Heath Ledger")
aaron_eckhart = Actor.find_by(name: "Aaron Eckhart")
maggie_gyllenhaal = Actor.find_by(name: "Maggie Gyllenhaal")
tom_hardy = Actor.find_by(name: "Tom Hardy")
joseph_gordon_levitt = Actor.find_by(name: "Joseph Gordon-Levitt")
anne_hathaway = Actor.find_by(name: "Anne Hathaway")

# Create the roles
Role.create(movie_id: batman_begins.id, actor_id: christian_bale.id, character_name: "Bruce Wayne")
Role.create(movie_id: batman_begins.id, actor_id: michael_caine.id, character_name: "Alfred")
Role.create(movie_id: batman_begins.id, actor_id: liam_neeson.id, character_name: "Ra's Al Ghul")
Role.create(movie_id: batman_begins.id, actor_id: katie_holmes.id, character_name: "Rachel Dawes")
Role.create(movie_id: batman_begins.id, actor_id: gary_oldman.id, character_name: "Commissioner Gordon")

Role.create(movie_id: the_dark_knight.id, actor_id: christian_bale.id, character_name: "Bruce Wayne")
Role.create(movie_id: the_dark_knight.id, actor_id: heath_ledger.id, character_name: "Joker")
Role.create(movie_id: the_dark_knight.id, actor_id: aaron_eckhart.id, character_name: "Harvey Dent")
Role.create(movie_id: the_dark_knight.id, actor_id: michael_caine.id, character_name: "Alfred")
Role.create(movie_id: the_dark_knight.id, actor_id: maggie_gyllenhaal.id, character_name: "Rachel Dawes")

Role.create(movie_id: the_dark_knight_rises.id, actor_id: christian_bale.id, character_name: "Bruce Wayne")
Role.create(movie_id: the_dark_knight_rises.id, actor_id: gary_oldman.id, character_name: "Commissioner Gordon")
Role.create(movie_id: the_dark_knight_rises.id, actor_id: tom_hardy.id, character_name: "Bane")
Role.create(movie_id: the_dark_knight_rises.id, actor_id: joseph_gordon_levitt.id, character_name: "John Blake")
Role.create(movie_id: the_dark_knight_rises.id, actor_id: anne_hathaway.id, character_name: "Selina Kyle")


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

movies = Movie.all

for i in movies
    studio = Studio.find_by(id: i.studio_id)  
    puts "#{i.title} #{i.year_released} #{i.rated} #{studio["name"]}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

roles = Role.all

for i in roles
    movie = Movie.find_by(id: i.movie_id)
    actor = Actor.find_by(id: i.actor_id)
    puts "#{movie.title }  /// #{actor.name} /// #{i.character_name}"
end

