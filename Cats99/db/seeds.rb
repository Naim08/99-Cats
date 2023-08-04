# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
  puts "Preparing #{Rails.env} environment"

  # These `destroy_all` commands are not necessary if you use `rails
  # db:seed:replant`. If they are present when you run `db:seed:replant`,
  # however, the command will essentially just destroy the tables twice,
  # resulting in a small increase in execution time but no other ill effects.
  puts 'Destroying tables...'
  Cat.destroy_all


  # Reset the id (i.e., primary key) counters for each table to start at 1
  # (helpful for debugging)
  puts 'Resetting id sequences...'
  %w(cats).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

cat1 = Cat.create!(name: "puss", color: "orange", sex: "M", birth_date: "2015/01/20", description: "Puss loves his boots")
cat2 = Cat.create!(name: "meowy", color: "white", sex: "F", birth_date: "2000/04/20", description: "ME-OW? NO. YOU OW")
cat3 = Cat.create!(name: "pickles", color: "brown", sex: "M", birth_date: "2005/02/09", description: "its me. zi, ive been turned into a cat, i mean, meow.")
cat4 = Cat.create!(name: "cain", color: "black", sex: "M", birth_date: "2004/03/14", description: "cain feels no pain")
cat5 = Cat.create!(name: "emily", color: "orange", sex: "F", birth_date: "2020/08/08", description: "orange power!")
  puts "Done with #{Rails.env} environment!"
end


