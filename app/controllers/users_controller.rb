class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # ポイント付与処理
  def give_point
    @user = User.find(params[:id])
    @sender = User.find(params[:sender_id])
    point_amount = params[:point_amount].to_i

    if point_amount > 0
      @sender.point_decreases.build(amount: point_amount).save!
      @user.point_increases.build(amount: point_amount).save!
      give_point = GivePoint.new(amount: point_amount, from_id: @sender.id, to_id: @user.id)
      give_point.save!
      Message.new(content: params[:message_content], from_id: @sender.id, to_id: @user.id, give_point_id: give_point.id).save!

      redirect_to @user, notice: "You sent points."
    else
      redirect_to @user, alert: "error while giving points."
    end
  end

  def give_point_new
    @user = User.find(params[:id])
    @from_users = User.where.not(id: @user.id)
    render :give_point_new
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:last_name, :first_name)
    end
end
