class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: %i[show edit update destroy set_index]

  # GET /railway_stations
  def index
    @railway_stations = RailwayStation.all
  end

  # GET /railway_stations/1
  def show; end

  # GET /railway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railway_stations/1/edit
  def edit; end

  # POST /railway_stations
  def create
    @railway_station = RailwayStation.new(railway_station_params)

    if @railway_station.save
      redirect_to [:admin, @railway_station], notice: 'Railway station was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /railway_stations/1
  def update
    if @railway_station.update(railway_station_params)
      redirect_to admin_railway_stations_path, notice: 'Railway station was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /railway_stations/1
  def destroy
    @railway_station.destroy
    redirect_to admin_railway_stations_url, notice: 'Railway station was successfully destroyed.'
  end

  def set_index
    route = Route.find(params[:route_id])
    @railway_station.set_index_on(route, params[:position])
    redirect_to [:admin, route]
  end

  def set_shedule
    @railway_station = RailwayStation.find(params[:id])
    @railway_station.update_shedule(params[:arrival_at], params[:departure_at])
    redirect_to new_search_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def railway_station_params
    params.require(:railway_station).permit(:title)
  end
end
