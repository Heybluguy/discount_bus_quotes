FactoryBot.define do
  factory :company do
    name "firstclass transportation"
    phone "904-964-504"
    email "fct@mail.com"
    website "firstclasstransportation.com"
    description "transportation for all"
    image { File.new("#{Rails.root}/spec/data/image.jpeg") }
  end
end