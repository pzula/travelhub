class TripsController < ApplicationController
  def new
    redirect_to root_path unless current_user
    @trip = Trip.new
  end

  def index
    @trips = current_user.trips
  end

  def edit
    @trip = current_user.trips.find(params[:id])
  end

  def update
    trip = current_user.trips.find(params[:id])
    trip_params = params[:trip]
    if trip.update(:name => trip_params[:name],
                :description => trip_params[:description],
                :starts_at => trip_params[:starts_at],
                :ends_at => trip_params[:ends_at])
      redirect_to trip, notice: "Trip Updated!"
    else
      render action: 'edit', notice: "Update Failed!"
    end
  end

  def create
    trip_params = params[:trip]
    @trip = Trip.new
    @trip.user_id = current_user.id
    @trip.name = trip_params[:name]
    @trip.description = trip_params[:description]
    @trip.starts_at = DateTime.strptime(trip_params[:starts_at], "%m/%d/%Y")
    @trip.ends_at = DateTime.strptime(trip_params[:ends_at], "%m/%d/%Y")

     if @trip.save!
       flash[:notice] ="Awesome Trip"
       redirect_to trip_path(@trip)
     else
       flash[:notice] = "FAIL"
       redirect_to root_path
     end
  end

  def show
    @trip = Trip.find(params[:id])
    if current_user && @trip.user_id == current_user.id
      @owner = true
    # else
    #   @owner = nil
    end
    @photos = PhotosAPI.feed_for(@trip.user.id, @trip.starts_at, @trip.ends_at)
    @statuses = StatusesAPI.feed_for(@trip.user.id, @trip.starts_at, @trip.ends_at)
    @checkins = CheckinsAPI.feed_for(@trip.user.id, @trip.starts_at, @trip.ends_at)
  end

  def dashboard
    if current_user && current_user.trips.any?
      @trips = current_user.trips
    else
      flash[:notice] = "You do not have any trips!"
      redirect_to root_path
    end
  end
end