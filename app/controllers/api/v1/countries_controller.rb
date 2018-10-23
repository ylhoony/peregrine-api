# frozen_string_literal: true

class Api::V1::CountriesController < ApplicationController
  before_action :set_country, only: %i[show update]

  def index
    countries = Country.all.to_a
    render json: countries
  end

  def create
    country = Country.new(country_params)
    if country.save
      render json: country
    else
      render json: { error: country.errors.messages }
    end
  end

  def show
    render json: country if @country.valid?
  end

  def update
    if @country.update(country_params)
      render json: @country
    else
      render json: { error: @country.errors.messages }
    end
  end

  protected

  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name, :iso_2, :iso_3, :numeric, :active)
  end
end
