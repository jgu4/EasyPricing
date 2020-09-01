class ItemsController < ApplicationController
  def index
    matching_items = Item.all

    @list_of_items = matching_items.order({ :created_at => :desc })

    render({ :template => "items/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_items = Item.where({ :id => the_id })

    @the_item = matching_items.at(0)

    render({ :template => "items/show.html.erb" })
  end

  def create

    new_cost=Costing.new
    new_cost.cost_value = params.fetch("query_cost_value")
    new_cost.save

    the_item = Item.new
    the_item.item_number = params.fetch("query_item_number")
    the_item.item_description = params.fetch("query_item_description")
    # the_item.cost_id = params.fetch("query_cost_id")
    # the_item.costing.cost_value = params.fetch("query_cost_value")
    
    the_item.cost_id = new_cost.id
   
    # the_item.costing.cost_value = new_cost.cost_value

    # the_item.user_id = params.fetch("query_user_id")
    the_item.user_id = @current_user.id
    # the_item.classification_id = params.fetch("query_classification_id")
    the_item.classification_id = params.fetch("query_classification_id")

    if the_item.valid?
      the_item.save

    new_inv=Inventory.new
    new_inv.store_id=params.fetch("query_store_id")
    new_inv.item_id=the_item.id
    new_inv.save

    # @store_factor=Store({:id=>new_inv.store_id}).store_value.to_f



      redirect_to("/items", { :notice => "Item created successfully." })
    else
      redirect_to("/items", { :notice => "Item failed to create successfully." })
    end




  end

  def update

    the_id = params.fetch("path_id")
    @the_item = Item.where({ :id => the_id }).at(0)

    update_cost=Costing.where({:id=>@the_item.cost_id}).at(0)
    update_cost.cost_value = params.fetch("query_cost_value")
    update_cost.save


    @the_item.item_number = params.fetch("query_item_number")
    @the_item.item_description = params.fetch("query_item_description")
    # @the_item.cost_id = params.fetch("query_cost_id")
    @the_item.cost_id = update_cost.id
    # @the_item.costing.cost_value = params.fetch("query_cost_value")
    # the_item.user_id = params.fetch("query_user_id")
    @the_item.classification_id = params.fetch("query_classification_id")

    if @the_item.valid?
      @the_item.save
      redirect_to("/items/#{@the_item.id}", { :notice => "Item updated successfully."} )
    else
      redirect_to("/items/#{@the_item.id}", { :alert => "Item failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_item = Item.where({ :id => the_id }).at(0)

    the_item.destroy

    redirect_to("/items", { :notice => "Item deleted successfully."} )
  end
end
