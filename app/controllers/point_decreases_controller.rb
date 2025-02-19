class PointDecreasesController < ApplicationController
  before_action :set_user, expect: :show

  # GET /point_decreases or /point_decreases.json
  def index
    @point_decreases = PointDecrease.all
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  # GET /point_decreases/1 or /point_decreases/1.json
  def show
    @point_decrease = PointDecrease.find(params[:id])
  end

  # GET /point_decreases/new
  def new
    @point_decrease = @user.point_decreases.build
  end

  # GET /point_decreases/1/edit
  def edit
  end

  # POST /point_decreases or /point_decreases.json
  def create
    @point_decrease = @user.point_decreases.build(point_decrease_params)

    if @point_decrease.save
      redirect_to user_point_decreases_path(@user), notice: 'ポイントを減らしました'
    else
      render :new
    end
  end

  # PATCH/PUT /point_decreases/1 or /point_decreases/1.json
  def update
    respond_to do |format|
      if @point_decrease.update(point_decrease_params)
        format.html { redirect_to @point_decrease, notice: "Point decrease was successfully updated." }
        format.json { render :show, status: :ok, location: @point_decrease }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @point_decrease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /point_decreases/1 or /point_decreases/1.json
  def destroy
    @point_decrease.destroy!

    respond_to do |format|
      format.html { redirect_to point_decreases_path, status: :see_other, notice: "Point decrease was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point_decrease
      @point_decrease = PointDecrease.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def point_decrease_params
      params.require(:point_decrease).permit(:amount)
    end
end
