class CombinedsController < ApplicationController
  before_action :set_combined, only: [:show, :edit, :update, :destroy]

  def index
    @combineds = Combined.all
  end

  def show
    @combined_items = @combined.combined_items
  end

  def new
    @combined = Combined.new
  end

  def edit; end

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

  def destroy
    @combined.destroy
    respond_to do |format|
      format.html { redirect_to combineds_url, notice: 'Combined was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_combined
    @combined = Combined.find(params[:id])
  end

  def combined_params
    params.require(:combined).permit(:name, :quantity)
  end
end
