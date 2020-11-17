class RecipeCombinedItemsController < ApplicationController
  before_action :set_recipe, only: %i[new, edit]
  before_action :set_recipe_combined_item, only: [:show, :edit, :update, :destroy]

  def index
    @recipe_combined_items = RecipeCombinedItem.all
  end

  def show; end

  def new
    @recipe_combined_item = RecipeCombinedItem.new
  end

  def edit; end

  def create
    @recipe_combined_item = RecipeCombinedItem.new(recipe_combined_item_params)

    respond_to do |format|
      if @recipe_combined_item.save
        format.html { redirect_to @recipe_combined_item.recipe, notice: 'Recipe combined item was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_combined_item }
      else
        format.html { render :new }
        format.json { render json: @recipe_combined_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe_combined_item.update(recipe_combined_item_params)
        format.html { redirect_to @recipe_combined_item, notice: 'Recipe combined item was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_combined_item }
      else
        format.html { render :edit }
        format.json { render json: @recipe_combined_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_combined_item.destroy
    respond_to do |format|
      format.html { redirect_to recipe_combined_items_url, notice: 'Recipe combined item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_recipe_combined_item
    @recipe_combined_item = RecipeCombinedItem.find(params[:id])
  end

  def recipe_combined_item_params
    params.require(:recipe_combined_item).permit(:recipe_id, :combined_id, :quantity)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
