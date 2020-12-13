class RecurringsController < ApplicationController
  before_action :set_recurring, only: [:show, :edit, :update, :destroy]

  # GET /recurrings
  # GET /recurrings.json
  def index
    @recurrings = Recurring.all.order(name: :asc)
    @total = @recurrings.inject(0) {|total, r| total + r.cost}
  end

  # GET /recurrings/1
  # GET /recurrings/1.json
  def show
  end

  # GET /recurrings/new
  def new
    @recurring = Recurring.new
  end

  # GET /recurrings/1/edit
  def edit
  end

  # POST /recurrings
  # POST /recurrings.json
  def create
    @recurring = Recurring.new(recurring_params)

    respond_to do |format|
      if @recurring.save
        format.html { redirect_to @recurring, notice: 'Recurring was successfully created.' }
        format.json { render :show, status: :created, location: @recurring }
      else
        format.html { render :new }
        format.json { render json: @recurring.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recurrings/1
  # PATCH/PUT /recurrings/1.json
  def update
    respond_to do |format|
      if @recurring.update(recurring_params)
        format.html { redirect_to @recurring, notice: 'Recurring was successfully updated.' }
        format.json { render :show, status: :ok, location: @recurring }
      else
        format.html { render :edit }
        format.json { render json: @recurring.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recurrings/1
  # DELETE /recurrings/1.json
  def destroy
    @recurring.destroy
    respond_to do |format|
      format.html { redirect_to recurrings_url, notice: 'Recurring was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recurring
      @recurring = Recurring.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recurring_params
      params.require(:recurring).permit(:name, :cost)
    end
end
