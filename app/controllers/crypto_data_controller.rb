class CryptoDataController < ApplicationController
  before_action :set_crypto_datum, only: %i[ show update destroy ]

  # GET /crypto_data
  def index
    @crypto_data = CryptoDatum.all

    render json: @crypto_data
  end

  # GET /crypto_data/1
  def show
    render json: @crypto_datum
  end

  # POST /crypto_data
  def create
    @crypto_datum = CryptoDatum.new(crypto_datum_params)

    if @crypto_datum.save
      render json: @crypto_datum, status: :created, location: @crypto_datum
    else
      render json: @crypto_datum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /crypto_data/1
  def update
    if @crypto_datum.update(crypto_datum_params)
      render json: @crypto_datum
    else
      render json: @crypto_datum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /crypto_data/1
  def destroy
    @crypto_datum.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crypto_datum
      @crypto_datum = CryptoDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crypto_datum_params
      params.require(:crypto_datum).permit(:user_document, :credit_card_token, :value)
    end
end
