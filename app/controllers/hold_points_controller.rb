class HoldPointsController < ApplicationController
  before_action :set_hold_point, only: %i[ show edit update destroy ]

  # GET /hold_points or /hold_points.json
  def index
    @hold_points = HoldPoint.all
  end

  # GET /hold_points/1 or /hold_points/1.json
  def show
  end

  # GET /hold_points/new
  def new
    @hold_point = HoldPoint.new
  end

  # GET /hold_points/1/edit
  def edit
  end

  # POST /hold_points or /hold_points.json
  def create
    @hold_point = HoldPoint.new(hold_point_params)

    respond_to do |format|
      if @hold_point.save
        format.html { redirect_to @hold_point, notice: "Hold point was successfully created." }
        format.json { render :show, status: :created, location: @hold_point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hold_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hold_points/1 or /hold_points/1.json
  def update
    respond_to do |format|
      if @hold_point.update(hold_point_params)
        format.html { redirect_to @hold_point, notice: "Hold point was successfully updated." }
        format.json { render :show, status: :ok, location: @hold_point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hold_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hold_points/1 or /hold_points/1.json
  def destroy
    @hold_point.destroy!

    respond_to do |format|
      format.html { redirect_to hold_points_path, status: :see_other, notice: "Hold point was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hold_point
      @hold_point = HoldPoint.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def hold_point_params
      params.fetch(:hold_point, {})
    end
end
