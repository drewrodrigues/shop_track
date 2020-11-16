class RecipeProcessedItemsController < ApplicationController
  before_action :set_recipe, only: [:new, :show, :edit, :update, :destroy]
  before_action :set_recipe_processed_item, only: [:show, :edit, :update, :destroy]

  def show; end

  def new
    @recipe_processed_item = RecipeProcessedItem.new
  end

  def edit; end

  def create
    @recipe_processed_item = RecipeProcessedItem.new(recipe_processed_item_params)

    respond_to do |format|
      if @recipe_processed_item.save
        format.html { redirect_to @recipe_processed_item.recipe, notice: 'Recipe processed item was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_processed_item }
      else
        format.html { render :new }
        format.json { render json: @recipe_processed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe_processed_item.update(recipe_processed_item_params)
        format.html { redirect_to @recipe_processed_item.recipe, notice: 'Recipe processed item was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_processed_item }
      else
        format.html { render :edit }
        format.json { render json: @recipe_processed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_processed_item.destroy
    respond_to do |format|
      format.html { redirect_to @recipe.recipe, notice: 'Recipe processed item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_recipe_processed_item
    @recipe_processed_item = RecipeProcessedItem.find(params[:id])
  end

  def recipe_processed_item_params
    params.require(:recipe_processed_item).permit(:recipe_id, :processed_item_id, :quantity)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_item = @recipe.recipe_items.build
  end
end
