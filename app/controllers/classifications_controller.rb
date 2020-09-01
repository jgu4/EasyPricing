class ClassificationsController < ApplicationController
  def index
    matching_classifications = Classification.all

    @list_of_classifications = matching_classifications.order({ :created_at => :desc })

    render({ :template => "classifications/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_classifications = Classification.where({ :id => the_id })

    @the_classification = matching_classifications.at(0)

    render({ :template => "classifications/show.html.erb" })
  end

  def create
    the_classification = Classification.new
    the_classification.family_description = params.fetch("query_family_description")
    the_classification.rule = params.fetch("query_rule")

    if the_classification.valid?
      the_classification.save
      redirect_to("/classifications", { :notice => "Classification created successfully." })
    else
      redirect_to("/classifications", { :notice => "Classification failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_classification = Classification.where({ :id => the_id }).at(0)

    the_classification.family_description = params.fetch("query_family_description")
    the_classification.rule = params.fetch("query_rule")

    if the_classification.valid?
      the_classification.save
      redirect_to("/classifications/#{the_classification.id}", { :notice => "Classification updated successfully."} )
    else
      redirect_to("/classifications/#{the_classification.id}", { :alert => "Classification failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_classification = Classification.where({ :id => the_id }).at(0)

    the_classification.destroy

    redirect_to("/classifications", { :notice => "Classification deleted successfully."} )
  end
end
