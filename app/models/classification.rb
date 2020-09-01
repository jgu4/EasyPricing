# == Schema Information
#
# Table name: classifications
#
#  id                 :integer          not null, primary key
#  family_description :string
#  rule               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Classification < ApplicationRecord
  has_many(:items, { :dependent => :destroy })
end
