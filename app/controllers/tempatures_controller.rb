class TempaturesController < ApplicationController
  before_action :set_tempature, only: [:show, :edit, :update, :destroy]

  # GET /tempatures
  # GET /tempatures.json
  def index
    @tempatures = Tempature.all
  end

  # GET /tempatures/1
  # GET /tempatures/1.json
  def show
  end

  # GET /tempatures/new
  def new
    @tempature = Tempature.new
  end

  # GET /tempatures/1/edit
  def edit
  end

  # POST /tempatures
  # POST /tempatures.json
  def create
    @tempature = Tempature.new(tempature_params)

    respond_to do |format|
      if @tempature.save
        format.html { redirect_to @tempature, notice: 'Tempature was successfully created.' }
        format.json { render :show, status: :created, location: @tempature }
      else
        format.html { render :new }
        format.json { render json: @tempature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tempatures/1
  # PATCH/PUT /tempatures/1.json
  def update
    respond_to do |format|
      if @tempature.update(tempature_params)
        format.html { redirect_to @tempature, notice: 'Tempature was successfully updated.' }
        format.json { render :show, status: :ok, location: @tempature }
      else
        format.html { render :edit }
        format.json { render json: @tempature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tempatures/1
  # DELETE /tempatures/1.json
  def destroy
    @tempature.destroy
    respond_to do |format|
      format.html { redirect_to tempatures_url, notice: 'Tempature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tempature
      @tempature = Tempature.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tempature_params
      params.require(:tempature).permit(:date, :time, :temp, :high, :low)
    end
end
