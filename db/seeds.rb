# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create({{ name: 'Chicago' }, { name: 'Copenhagen' }})
#   Mayor.create(name: 'Emanuel', city: cities.first)
[
  { name: 'blerg', email: 'bork@bork.com', password: '123', password_confirmation: '123' },
  { name: 'bill', email: 'oh@no.com', password: '123', password_confirmation: '123' },
  { name: 'ted', email: 'on@no.com', password: '123', password_confirmation: '123' },
  { name: 'blerg', email: 'no@no.com', password: '123', password_confirmation: '123' },
  { name: 'dreg', email: 'dreg@no.com', password: '123', password_confirmation: '123' },
  { name: 'fisk', email: 'fisk@no.com', password: '123', password_confirmation: '123' },
  { name: 'murdock', email: 'dd@no.com', password: '123', password_confirmation: '123' },
  { name: 'bort', email: 'thesimpsons@no.com', password: '123', password_confirmation: '123' },
  { name: 'make it stop', email: 'oy@vey.com', password: '123', password_confirmation: '123' },
  { name: 'there', email: 'has@tobeabetterway.com', password: '123', password_confirmation: '123' },
  { name: 'tocode', email: 'this@no.com', password: '123', password_confirmation: '123' }
].each do |user_params|
  User.create(user_params)
end
