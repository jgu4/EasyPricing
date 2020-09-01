class InventoriesController < ApplicationController
  def index
    matching_inventories = Inventory.all

    @list_of_inventories = matching_inventories.order({ :created_at => :desc })

    render({ :template => "inventories/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_inventories = Inventory.where({ :id => the_id })

    @the_inventory = matching_inventories.at(0)

    render({ :template => "inventories/show.html.erb" })
  end

  def create
    the_inventory = Inventory.new
    the_inventory.item_id = params.fetch("query_item_id")
    the_inventory.store_id = params.fetch("query_store_id")
    the_inventory.price_result = params.fetch("query_price_result")

    if the_inventory.valid?
      the_inventory.save
      redirect_to("/inventories", { :notice => "Inventory created successfully." })
    else
      redirect_to("/inventories", { :notice => "Inventory failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_inventory = Inventory.where({ :id => the_id }).at(0)

    the_inventory.item_id = params.fetch("query_item_id")
    the_inventory.store_id = params.fetch("query_store_id")
    the_inventory.price_result = params.fetch("query_price_result")

    if the_inventory.valid?
      the_inventory.save
      redirect_to("/inventories/#{the_inventory.id}", { :notice => "Inventory updated successfully."} )
    else
      redirect_to("/inventories/#{the_inventory.id}", { :alert => "Inventory failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_inventory = Inventory.where({ :id => the_id }).at(0)

    the_inventory.destroy

    redirect_to("/inventories", { :notice => "Inventory deleted successfully."} )
  end
end
