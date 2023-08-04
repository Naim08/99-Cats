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
  %w(users artworks artwork_shares).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

cat1 = Cat.create!(name: "puss", color: "orange", sex: "M", birth_date: "2015/01/20", description: "Puss loves his boots")


  puts "Done with #{Rails.env} environment!"
end


