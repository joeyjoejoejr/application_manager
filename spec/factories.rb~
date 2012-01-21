FactoryGirl.define do

	factory :user do
		first_name 'Foo'
		last_name 'Bar'
		sequence(:email) {|n| "foo#{n}@bar.com" }
		admin false
		password 'secret'
		password_confirmation { |u| u.password }
	end

end
