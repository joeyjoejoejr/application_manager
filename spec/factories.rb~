FactoryGirl.define do

	factory :user do
		first_name 'foo'
		last_name 'bar'
		sequence(:email) {|n| "foo#{n}@bar.com" }
		admin false
		password 'secret'
		password_confirmation { |u| u.password }
	end

end
