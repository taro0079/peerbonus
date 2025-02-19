class PointIncreasesController < ApplicationController
  before_action :set_user, except: :show

  # GET /point_increases or /point_increases.json
  def index
    @point_increases = PointIncrease.all
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  # GET /point_increases/1 or /point_increases/1.json
  def show
    @point_increase = PointIncrease.find(params[:id])
  end

  # GET /point_increases/new
  def new
    @point_increase = @user.point_increases.build
  end

  # GET /point_increases/1/edit
  def edit
  end

  # POST /point_increases or /point_increases.json
  def create
    @point_increase = @user.point_increases.build(point_increase_params)

    if @point_increase.save
      redirect_to user_point_increases_path(@user), notice: 'ポイントを増加しました'
    else
      render :new
    end
  end

  # PATCH/PUT /point_increases/1 or /point_increases/1.json
  def update
    respond_to do |format|
      if @point_increase.update(point_increase_params)
        format.html { redirect_to @point_increase, notice: "Point increase was successfully updated." }
        format.json { render :show, status: :ok, location: @point_increase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @point_increase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /point_increases/1 or /point_increases/1.json
  def destroy
    @point_increase.destroy!

    respond_to do |format|
      format.html { redirect_to point_increases_path, status: :see_other, notice: "Point increase was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point_increase
      @point_increase = PointIncrease.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def point_increase_params
      params.require(:point_increase).permit(:amount)
    end
end
