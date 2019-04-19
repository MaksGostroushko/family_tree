class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit]
  # before_action :logged_in_user, only: [:edit, :update]
  # before_action :correct_user,   only: [:edit, :update]
  def new
    attr_accessor :name, :email, :password

    def initialize(attributes = {})
      @name  = attributes[:name]
      @email = attributes[:email]
      @password = attributes[:password]
    end
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end

  def index
    @users = User.order(:name).page(params[:page])
    @user = current_user
  end

  # def new
  #   @user = User.new
  # end
  #
  # def show
  #   @relatives = @user.relatives
  # end
  #
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     log_in @user
  #     flash[:success] = t(".welcome") + ", " + "#{@user.name}"
  #     UserMailer.send_mail_to_user(@user).deliver_now!
  #     UserMailer.send_mail_to_admin(@user).deliver_now!
  #     redirect_to root_path
  #   else
  #     render 'new'
  #   end
  # end
  #
  def edit; end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      sign_in @user
      flash[:success] = t('.edit')
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def add_collaborator
    @user = current_user
    # @user = current_user.collaborators.push
  end

  private

  def user_params
    if params[:collaborator_ids].present?
      # debugger
      # params[:collaborator_ids].map { |e| e  }
      params.require(:user).permit(:name, :second_name, :email, :password, :password_confirmation, :image, :collaborator_ids, :collaborators)

    else
     params.require(:user).permit(:name, :second_name, :email, :password, :password_confirmation, :image, :locale, :collaborators)
    end
   end

   def find_user
     @user = User.find(params[:id])
   end

   # def logged_in_user
   #   unless logged_in?
   #     flash[:danger] = "Please log in."
   #     redirect_to login_url
   #   end
   # end
   #
   #  def correct_user
   #    @user = User.find(params[:id])
   #    redirect_to(root_url) unless current_user?(@user)
   #  end
end
