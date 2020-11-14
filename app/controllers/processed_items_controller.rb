class ProcessedItemsController < ApplicationController
  before_action :set_processed_item, only: [:show, :edit, :update, :destroy]

  # GET /processed_items
  # GET /processed_items.json
  def index
    @processed_items = ProcessedItem.all
  end

  # GET /processed_items/1
  # GET /processed_items/1.json
  def show
  end

  # GET /processed_items/new
  def new
    @processed_item = ProcessedItem.new
  end

  # GET /processed_items/1/edit
  def edit
  end

  # POST /processed_items
  # POST /processed_items.json
  def create
    @processed_item = ProcessedItem.new(processed_item_params)

    respond_to do |format|
      if @processed_item.save
        format.html { redirect_to @processed_item, notice: 'Processed item was successfully created.' }
        format.json { render :show, status: :created, location: @processed_item }
      else
        format.html { render :new }
        format.json { render json: @processed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processed_items/1
  # PATCH/PUT /processed_items/1.json
  def update
    respond_to do |format|
      if @processed_item.update(processed_item_params)
        format.html { redirect_to @processed_item, notice: 'Processed item was successfully updated.' }
        format.json { render :show, status: :ok, location: @processed_item }
      else
        format.html { render :edit }
        format.json { render json: @processed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processed_items/1
  # DELETE /processed_items/1.json
  def destroy
    @processed_item.destroy
    respond_to do |format|
      format.html { redirect_to processed_items_url, notice: 'Processed item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processed_item
      @processed_item = ProcessedItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def processed_item_params
      params.require(:processed_item).permit(:receipt_id, :converts_to_quantity, :converts_to_scale)
    end
end
