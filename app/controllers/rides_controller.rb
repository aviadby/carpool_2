class RidesController < ApplicationController
  before_action :current_user_must_be_ride_leader, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_ride_leader
    ride = Ride.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == ride.leader
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Ride.ransack(params[:q])
    @rides = @q.result(:distinct => true).includes(:leader, :spots).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@rides.where.not(:destination_latitude => nil)) do |ride, marker|
      marker.lat ride.destination_latitude
      marker.lng ride.destination_longitude
      marker.infowindow "<h5><a href='/rides/#{ride.id}'>#{ride.created_at}</a></h5><small>#{ride.destination_formatted_address}</small>"
    end
    @location_hash = Gmaps4rails.build_markers(@rides.where.not(:origin_latitude => nil)) do |ride, marker|
      marker.lat ride.origin_latitude
      marker.lng ride.origin_longitude
      marker.infowindow "<h5><a href='/rides/#{ride.id}'>#{ride.created_at}</a></h5><small>#{ride.origin_formatted_address}</small>"
    end

    render("ride_templates/index.html.erb")
  end

  def show
    @spot = Spot.new
    @ride = Ride.find(params.fetch("id_to_display"))

    render("ride_templates/show.html.erb")
  end

  def new_form
    @ride = Ride.new

    render("ride_templates/new_form.html.erb")
  end

  def create_row
    @ride = Ride.new

    @ride.origin = params.fetch("origin")
    @ride.destination = params.fetch("destination")
    @ride.departs = params.fetch("departs")
    @ride.ride_leader = params.fetch("ride_leader")

    if @ride.valid?
      @ride.save

      redirect_back(:fallback_location => "/rides", :notice => "Ride created successfully.")
    else
      render("ride_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @ride = Ride.find(params.fetch("prefill_with_id"))

    render("ride_templates/edit_form.html.erb")
  end

  def update_row
    @ride = Ride.find(params.fetch("id_to_modify"))

    @ride.origin = params.fetch("origin")
    @ride.destination = params.fetch("destination")
    @ride.departs = params.fetch("departs")
    

    if @ride.valid?
      @ride.save

      redirect_to("/rides/#{@ride.id}", :notice => "Ride updated successfully.")
    else
      render("ride_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_leader
    @ride = Ride.find(params.fetch("id_to_remove"))

    @ride.destroy

    redirect_to("/users/#{@ride.ride_leader}", notice: "Ride deleted successfully.")
  end

  def destroy_row
    @ride = Ride.find(params.fetch("id_to_remove"))

    @ride.destroy

    redirect_to("/rides", :notice => "Ride deleted successfully.")
  end
end
