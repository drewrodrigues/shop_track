class KitchenItemsController < ApplicationController
  before_action :set_kitchen_item, only: [:show, :edit, :update, :destroy]

  def index
    @kitchen_items = KitchenItem.order("name asc").all
  end

  def show; end

  def new
    @kitchen_item = KitchenItem.new
  end

  def edit; end

  def create
    @kitchen_item = KitchenItem.new(kitchen_item_params)

    respond_to do |format|
      if @kitchen_item.save
        format.html { redirect_to kitchen_items_path, notice: 'Kitchen item was successfully created.' }
        format.json { render :show, status: :created, location: @kitchen_item }
      else
        format.html { render :new }
        format.json { render json: @kitchen_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @kitchen_item.update(kitchen_item_params)
        format.html { redirect_to @kitchen_item, notice: 'Kitchen item was successfully updated.' }
        format.json { render :show, status: :ok, location: @kitchen_item }
      else
        format.html { render :edit }
        format.json { render json: @kitchen_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @kitchen_item.destroy
    respond_to do |format|
      format.html { redirect_to kitchen_items_url, notice: 'Kitchen item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_kitchen_item
    @kitchen_item = KitchenItem.find(params[:id])
  end

  def kitchen_item_params
    params.require(:kitchen_item).permit(:name)
  end
end
