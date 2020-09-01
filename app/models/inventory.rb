# == Schema Information
#
# Table name: inventories
#
#  id           :integer          not null, primary key
#  price_result :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  item_id      :integer
#  store_id     :integer
#
class Inventory < ApplicationRecord
  belongs_to(:item)
  belongs_to(:store_add, {:class_name=>"Store",:foreign_key=>"store_id"})
end

# belongs_to(:director, { :class_name => "Director", :foreign_key => "director_id" })