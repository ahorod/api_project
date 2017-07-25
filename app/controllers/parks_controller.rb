class ParksController < ApplicationController

  def index
    @parks = Park.all
    json_response(@parks)
  end

  def show
    @park = Park.find(params[:id])
    json_response(@park)
  end

  def create
    @park = Park.create(park_params)
    if @park.save
      render json: @park, status: :created, location: @park
    else
      render json: @park.errors, status: :unprocessable_entity
    end
  end

  def update
    @park = Park.find(params[:id])
    if @park.update(park_params)
      render json: @park
    else
      render json: @park.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @park = Park.find(params[:id])
    @park.destroy
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def park_params
    params.permit(:name, :location)
  end
end
