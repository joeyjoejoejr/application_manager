# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :school do
      type ""
      name "MyString"
      major "MyString"
      degree "MyString"
      date_recieved "2012-01-23"
    end
end