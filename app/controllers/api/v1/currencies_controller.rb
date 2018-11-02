class Api::V1::CurrenciesController < ApiController
  before_action :set_currency, only: %i[show update]

  def index
    countries = Currency.all.to_a
    render json: countries
  end

  def create
    currency = Currency.new(currency_params)
    if currency.save
      render json: currency
    else
      render json: { error: currency.errors.messages }
    end
  end

  def show
    render json: currency if @currency.valid?
  end

  def update
    if @currency.update(currency_params)
      render json: @currency
    else
      render json: { error: @currency.errors.messages }
    end
  end

  protected

  def set_currency
    @currency = currency.find(params[:id])
  end

  def currency_params
    params.require(:currency).permit(:name, :iso_3, :numeric, :active)
  end
end
