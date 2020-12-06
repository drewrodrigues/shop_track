class MarketingsController < ApplicationController
  before_action :set_marketing, only: [:show, :edit, :update, :destroy]

  # GET /marketings
  # GET /marketings.json
  def index
    @marketings = Marketing.all

    marketings = Marketing.group(:date_used).sum(:quantity)
    sales = Sale.group_by_day(:pos_datetime).count
    @chart_data = [{name: 'Marketing', data: marketings}, {name: 'Sales', data: sales}]
  end

  # GET /marketings/1
  # GET /marketings/1.json
  def show
  end

  # GET /marketings/new
  def new
    @marketing = Marketing.new
  end

  # GET /marketings/1/edit
  def edit
  end

  # POST /marketings
  # POST /marketings.json
  def create
    @marketing = Marketing.new(marketing_params)

    respond_to do |format|
      if @marketing.save
        format.html { redirect_to @marketing, notice: 'Marketing was successfully created.' }
        format.json { render :show, status: :created, location: @marketing }
      else
        format.html { render :new }
        format.json { render json: @marketing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marketings/1
  # PATCH/PUT /marketings/1.json
  def update
    respond_to do |format|
      if @marketing.update(marketing_params)
        format.html { redirect_to @marketing, notice: 'Marketing was successfully updated.' }
        format.json { render :show, status: :ok, location: @marketing }
      else
        format.html { render :edit }
        format.json { render json: @marketing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marketings/1
  # DELETE /marketings/1.json
  def destroy
    @marketing.destroy
    respond_to do |format|
      format.html { redirect_to marketings_url, notice: 'Marketing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marketing
      @marketing = Marketing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def marketing_params
      params.require(:marketing).permit(:date_used, :quantity)
    end
end
