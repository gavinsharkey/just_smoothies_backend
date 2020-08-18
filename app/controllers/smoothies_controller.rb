class SmoothiesController < ApplicationController
  before_action :set_smoothy, only: [:show, :picture, :update, :destroy]

  # GET /smoothies
  def index
    @smoothies = Smoothie.by_created

    render json: @smoothies, methods: [:picture_url]
  end

  # GET /smoothies/1
  def show
    render json: @smoothy, methods: [:picture_url]
  end

  def picture
    if @smoothy.picture.attached?
      redirect_to rails_blob_url(@smoothy.picture)
    else
      render json: { status: 404, error: 'No Picture' }
    end
  end

  # POST /smoothies
  def create
    @smoothy = Smoothie.new(smoothy_params)

    if @smoothy.save
      render json: @smoothy, status: :created, location: @smoothy, methods: [:picture_url]
    else
      render json: @smoothy.errors, status: 'error'
    end
  end

  # PATCH/PUT /smoothies/1
  def update
    if @smoothy.update(smoothy_params)
      render json: @smoothy
    else
      render json: @smoothy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /smoothies/1
  def destroy
    @smoothy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smoothy
      @smoothy = Smoothie.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def smoothy_params
      params.permit(:name, :description, :instructions, :picture)
    end
end
