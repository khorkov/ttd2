class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    @search.user = current_user

    if @search.save
      redirect_to @search
    else
      render :new
    end
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:start_station_id, :finish_station_id)
  end
end
