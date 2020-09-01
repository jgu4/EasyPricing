# == Schema Information
#
# Table name: stores
#
#  id         :integer          not null, primary key
#  store_name :string
#  store_rule :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Store < ApplicationRecord
  has_many(:inventories, { :dependent => :destroy })
end
