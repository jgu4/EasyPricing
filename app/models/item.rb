# == Schema Information
#
# Table name: items
#
#  id                :integer          not null, primary key
#  item_description  :string
#  item_number       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  classification_id :integer
#  cost_id           :integer
#  user_id           :integer
#
class Item < ApplicationRecord

  has_many(:inventories, { :dependent => :destroy })
  belongs_to(:costing, {:class_name=>"Costing",:foreign_key=>"cost_id"})
  belongs_to(:classification)
  belongs_to(:user)

# belongs_to(:director, { :class_name => "Director", :foreign_key => "director_id" })

end
