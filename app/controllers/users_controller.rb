class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order(:firsname)
  end

  def show
  end
  def new
    @user = User.new
    @car = Car.find_car(params[:car_id])
  end

  def edit
  end

  def create
    @user = User.new(user_params) 
    user_params.merge(email: stripe_params["stripeEmail"], card_token: stripe_params["stripeToken"])
     raise "Please, check registration errors" unless @user.valid?
     @user.process_payment
     @user.save
       redirect_to root_path, notice: 'Registration was successfully created.'
   rescue Exception => e
    respond_to do |format|
      format.html { render :new ,  :flash => { :error => "#{e.message}" }}
    end
  end
  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User #{@user.surname} was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
     begin
      @user.destroy
      flash[:notice] = "User #{@user.surname} deleted"
    rescue StandardError => e
      flash[:notice] = e.message
    end
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    def stripe_params
      params.permit!(:stripeEmail, :stripeToken) 
    end
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:car_id, :firsname, :surname, :password, :password_confirmation, :role)
    end
end
