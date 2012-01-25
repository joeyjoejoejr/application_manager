# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Interest.create(:name => "Semester Internship")
Interest.create(:name => "Summer Internship")
Interest.create(:name => "Permanant Job")
Interest.create(:name => "Support for Developing an Idea")

#Admin User
user = User.create(:first_name => "Admin", :last_name => "User", 
            :email => "admin@example.com", :password => "foobar", 
            :password_confirmation => "foobar")
user.toggle!(:admin)
