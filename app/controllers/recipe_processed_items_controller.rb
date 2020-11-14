class RecipeProcessedItemsController < ApplicationController
  before_action :set_recipe_processed_item, only: [:show, :edit, :update, :destroy]

  # GET /recipe_processed_items
  # GET /recipe_processed_items.json
  def index
    @recipe_processed_items = RecipeProcessedItem.all
  end

  # GET /recipe_processed_items/1
  # GET /recipe_processed_items/1.json
  def show
  end

  # GET /recipe_processed_items/new
  def new
    @recipe_processed_item = RecipeProcessedItem.new
  end

  # GET /recipe_processed_items/1/edit
  def edit
  end

  # POST /recipe_processed_items
  # POST /recipe_processed_items.json
  def create
    @recipe_processed_item = RecipeProcessedItem.new(recipe_processed_item_params)

    respond_to do |format|
      if @recipe_processed_item.save
        format.html { redirect_to @recipe_processed_item, notice: 'Recipe processed item was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_processed_item }
      else
        format.html { render :new }
        format.json { render json: @recipe_processed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_processed_items/1
  # PATCH/PUT /recipe_processed_items/1.json
  def update
    respond_to do |format|
      if @recipe_processed_item.update(recipe_processed_item_params)
        format.html { redirect_to @recipe_processed_item, notice: 'Recipe processed item was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_processed_item }
      else
        format.html { render :edit }
        format.json { render json: @recipe_processed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_processed_items/1
  # DELETE /recipe_processed_items/1.json
  def destroy
    @recipe_processed_item.destroy
    respond_to do |format|
      format.html { redirect_to recipe_processed_items_url, notice: 'Recipe processed item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_processed_item
      @recipe_processed_item = RecipeProcessedItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_processed_item_params
      params.require(:recipe_processed_item).permit(:recipe_id, :processed_item_id)
    end
end
