class SpotsController < ApplicationController
  before_action :current_user_must_be_spot_joiner, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_spot_joiner
    spot = Spot.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == spot.joiner
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @spots = current_user.spots.page(params[:page]).per(10)

    render("spot_templates/index.html.erb")
  end

  def show
    @spot = Spot.find(params.fetch("id_to_display"))

    render("spot_templates/show.html.erb")
  end

  def new_form
    @spot = Spot.new

    render("spot_templates/new_form.html.erb")
  end

  def create_row
    @spot = Spot.new

    @spot.ride_id = params.fetch("ride_id")
    @spot.joiner_id = params.fetch("joiner_id")

    if @spot.valid?
      @spot.save

      redirect_back(:fallback_location => "/spots", :notice => "Spot created successfully.")
    else
      render("spot_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_ride
    @spot = Spot.new

    @spot.ride_id = params.fetch("ride_id")
    @spot.joiner_id = params.fetch("joiner_id")

    if @spot.valid?
      @spot.save

      redirect_to("/rides/#{@spot.ride_id}", notice: "Spot created successfully.")
    else
      render("spot_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @spot = Spot.find(params.fetch("prefill_with_id"))

    render("spot_templates/edit_form.html.erb")
  end

  def update_row
    @spot = Spot.find(params.fetch("id_to_modify"))

    @spot.ride_id = params.fetch("ride_id")
    

    if @spot.valid?
      @spot.save

      redirect_to("/spots/#{@spot.id}", :notice => "Spot updated successfully.")
    else
      render("spot_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_joiner
    @spot = Spot.find(params.fetch("id_to_remove"))

    @spot.destroy

    redirect_to("/users/#{@spot.joiner_id}", notice: "Spot deleted successfully.")
  end

  def destroy_row_from_ride
    @spot = Spot.find(params.fetch("id_to_remove"))

    @spot.destroy

    redirect_to("/rides/#{@spot.ride_id}", notice: "Spot deleted successfully.")
  end

  def destroy_row
    @spot = Spot.find(params.fetch("id_to_remove"))

    @spot.destroy

    redirect_to("/spots", :notice => "Spot deleted successfully.")
  end
end
