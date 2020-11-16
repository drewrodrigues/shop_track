class CombinedsController < ApplicationController
  before_action :set_combined, only: [:show, :edit, :update, :destroy]

  # GET /combineds
  # GET /combineds.json
  def index
    @combineds = Combined.all
  end

  # GET /combineds/1
  # GET /combineds/1.json
  def show
  end

  # GET /combineds/new
  def new
    @combined = Combined.new
  end

  # GET /combineds/1/edit
  def edit
  end

  # POST /combineds
  # POST /combineds.json
  def create
    @combined = Combined.new(combined_params)

    respond_to do |format|
      if @combined.save
        format.html { redirect_to @combined, notice: 'Combined was successfully created.' }
        format.json { render :show, status: :created, location: @combined }
      else
        format.html { render :new }
        format.json { render json: @combined.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /combineds/1
  # PATCH/PUT /combineds/1.json
  def update
    respond_to do |format|
      if @combined.update(combined_params)
        format.html { redirect_to @combined, notice: 'Combined was successfully updated.' }
        format.json { render :show, status: :ok, location: @combined }
      else
        format.html { render :edit }
        format.json { render json: @combined.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /combineds/1
  # DELETE /combineds/1.json
  def destroy
    @combined.destroy
    respond_to do |format|
      format.html { redirect_to combineds_url, notice: 'Combined was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_combined
      @combined = Combined.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def combined_params
      params.require(:combined).permit(:name)
    end
end
