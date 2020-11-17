class CombinedItemsController < ApplicationController
  before_action :set_combined, only: :new
  before_action :set_combined_item, only: %i[show edit update destroy]

  def index
    @combined_items = CombinedItem.all
  end

  def show; end

  def new
    @combined_item = CombinedItem.new
  end

  def edit; end

  def create
    @combined_item = CombinedItem.new(combined_item_params)

    respond_to do |format|
      if @combined_item.save
        format.html { redirect_to @combined_item.combined, notice: 'Combined item was successfully created.' }
        format.json { render :show, status: :created, location: @combined_item }
      else
        format.html { render :new }
        format.json { render json: @combined_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @combined_item.update(combined_item_params)
        format.html { redirect_to @combined_item.combined, notice: 'Combined item was successfully updated.' }
        format.json { render :show, status: :ok, location: @combined_item }
      else
        format.html { render :edit }
        format.json { render json: @combined_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @combined_item.destroy
    respond_to do |format|
      format.html { redirect_to @combined_item.combined, notice: 'Combined item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_combined_item
    @combined_item = CombinedItem.find(params[:id])
  end

  def combined_item_params
    params.require(:combined_item).permit(:receipt_id, :quantity, :quantity_scale, :combined_id)
  end

  def set_combined
    @combined = Combined.find(params[:combined_id])
  end
end