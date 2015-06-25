[
  { name: 'bork', email: 'bork@bork.com', password: '123', password_confirmation: '123' },
  { name: 'bill', email: 'oh@no.com', password: '123', password_confirmation: '123' },
  { name: 'ted', email: 'on@no.com', password: '123', password_confirmation: '123' },
  { name: 'matt', email: 'no@nope.com', password: '123', password_confirmation: '123' },
  { name: 'dreg', email: 'dreg@no.com', password: '123', password_confirmation: '123' },
  { name: 'peteandpete', email: 'pap@no.com', password: '123', password_confirmation: '123' },
  { name: 'murdock', email: 'dd@no.com', password: '123', password_confirmation: '123' },
  { name: 'bort', email: 'thesimpsons@no.com', password: '123', password_confirmation: '123' },
  { name: 'make it stop', email: 'oy@vey.com', password: '123', password_confirmation: '123' },
  { name: 'there', email: 'has@tobeabetterway.com', password: '123', password_confirmation: '123' },
  { name: 'tocode', email: 'this@no.com', password: '123', password_confirmation: '123' }
].each do |user_params|
  User.create!(user_params)
end