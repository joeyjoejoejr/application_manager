class Application < ActiveRecord::Base
attr_accessible :address , :city, :state, :zip_code, :phone_number, 
								:interest_ids, :schools_attributes, :jobs_attributes, :answer1,
								:answer2, :answer3

belongs_to :user
has_many :jobs, :dependent => :destroy
has_many :schools, :dependent => :destroy
has_many :interest_checkers
has_many :interests, :through => :interest_checkers

accepts_nested_attributes_for :schools, :allow_destroy => true
accepts_nested_attributes_for :jobs, :allow_destroy => true

validates :zip_code, 			:numericality => { :only_integer =>true,
													:greater_than => 9999,
													:less_than => 100000 }
													
validates :phone_number, :length => { :in => 10..12 }

end
# == Schema Information
#
# Table name: applications
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  address      :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  city         :string(255)
#  state        :string(255)
#  zip_code     :integer
#  phone_number :string(255)
#  answer1      :text
#  answer2      :text
#  answer3      :text
#

