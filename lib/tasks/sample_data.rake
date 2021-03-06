namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:first_name => "Example",
    					 :last_name => "User",
				         :email => "example@railstutorial.org",
				         :password => "foobar",
				         :password_confirmation => "foobar")
    admin.toggle!(:admin)
    
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:first_name => name.split[0],
      						 :last_name => name.split[1],
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end
