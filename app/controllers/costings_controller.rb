class CostingsController < ApplicationController
  def index
    matching_costings = Costing.all

    @list_of_costings = matching_costings.order({ :created_at => :desc })

    render({ :template => "costings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_costings = Costing.where({ :id => the_id })

    @the_costing = matching_costings.at(0)

    render({ :template => "costings/show.html.erb" })
  end

  def create
    the_costing = Costing.new
    the_costing.cost_value = params.fetch("query_cost_value")
    the_costing.item_id = params.fetch("query_item_id")
    the_costing.costing_type = params.fetch("query_costing_type")

    if the_costing.valid?
      the_costing.save
      redirect_to("/costings", { :notice => "Costing created successfully." })
    else
      redirect_to("/costings", { :notice => "Costing failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_costing = Costing.where({ :id => the_id }).at(0)

    the_costing.cost_value = params.fetch("query_cost_value")
    the_costing.item_id = params.fetch("query_item_id")
    the_costing.costing_type = params.fetch("query_costing_type")

    if the_costing.valid?
      the_costing.save
      redirect_to("/costings/#{the_costing.id}", { :notice => "Costing updated successfully."} )
    else
      redirect_to("/costings/#{the_costing.id}", { :alert => "Costing failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_costing = Costing.where({ :id => the_id }).at(0)

    the_costing.destroy

    redirect_to("/costings", { :notice => "Costing deleted successfully."} )
  end
end
