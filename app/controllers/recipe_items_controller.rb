class RecipeItemsController < ApplicationController
  before_action :set_recipe_item, only: [:show, :edit, :update, :destroy]
  before_action :set_recipe, only: [:new, :edit]

  # GET /recipe_items
  # GET /recipe_items.json
  def index
    @recipe_items = RecipeItem.all
  end

  # GET /recipe_items/1
  # GET /recipe_items/1.json
  def show
  end

  # GET /recipe_items/new
  def new
    @recipe_item = RecipeItem.new
  end

  # GET /recipe_items/1/edit
  def edit
  end

  # POST /recipe_items
  # POST /recipe_items.json
  def create
    @recipe_item = RecipeItem.new(recipe_item_params)

    respond_to do |format|
      if @recipe_item.save
        format.html { redirect_to @recipe_item.recipe, notice: 'Recipe item was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_item }
      else
        format.html { render :new }
        format.json { render json: @recipe_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_items/1
  # PATCH/PUT /recipe_items/1.json
  def update
    respond_to do |format|
      if @recipe_item.update(recipe_item_params)
        format.html { redirect_to @recipe_item, notice: 'Recipe item was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_item }
      else
        format.html { render :edit }
        format.json { render json: @recipe_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_items/1
  # DELETE /recipe_items/1.json
  def destroy
    @recipe_item.destroy
    respond_to do |format|
      format.html { redirect_to @recipe_item.recipe, notice: 'Recipe item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_recipe_item
    @recipe_item = RecipeItem.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def recipe_item_params
    params.require(:recipe_item).permit(:receipt_id, :quantity, :recipe_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_item = @recipe.recipe_items.build
  end
end
