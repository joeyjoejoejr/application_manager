# == Schema Information
#
# Table name: schools
#
#  id             :integer         not null, primary key
#  school_type    :string(255)
#  name           :string(255)
#  major          :string(255)
#  degree         :string(255)
#  date_recieved  :date
#  application_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class School < ActiveRecord::Base
	belongs_to :application
	attr_accessible :school_type, :name, :major, :degree, :date_recieved
end
