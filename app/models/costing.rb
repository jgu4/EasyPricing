# == Schema Information
#
# Table name: costings
#
#  id           :integer          not null, primary key
#  cost_value   :float
#  costing_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  item_id      :integer
#
class Costing < ApplicationRecord
  belongs_to(:item, {:class_name=>"Item", :foreign_key=>"item_id"})
end

# belongs_to(:director, { :class_name => "Director", :foreign_key => "director_id" })