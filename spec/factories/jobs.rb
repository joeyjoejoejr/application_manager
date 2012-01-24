# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
      application_id 1
      organization "MyString"
      start_date "2012-01-23"
      end_date "2012-01-23"
      responsibilities "MyText"
    end
end