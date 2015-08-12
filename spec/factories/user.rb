FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "person#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'this is a very secure password'
    password_confirmation 'this is a very secure password'
    # sequence(:image) { |n| "person#{n}.jpg" }
    # can this be made to work or do I have to manually select a pic
  end
  # factory :image do
  #   avatar { File.new("#{Rails.root}/spec/support/fixtures/image.jpg") }
  # end
end
