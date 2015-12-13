class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:update, :destroy]
  before_filter :authenticate_user!

  def index
    @users = User.order(:id).page params[:page]
  end

  def new
    @user = User.new
  end

  # 使用cancan后，create会导致ActiveModel::ForbiddenAttributesError错误
  # 解决办法在application_controller.rb中加入相应语句
  # https://github.com/ryanb/cancan/issues/835
  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.html { redirect_to users_path, notice: '用户创建成功.' }
      end
    else
      respond_to do |format|
        flash.now[:alert] = @user.errors.full_messages.join('</br>') do |msg|
        end
        format.html { render 'new' }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  # The only unusual code we added is to clean up the password request params
  # if the user’s password field is blank,( option: and validate the password with Devise’s
  # valid_password? method if it’s not blank. :curretn_user was cancled for Admin to reset the password
  # without :current_password valiudation)
  def update
    if params[:user][:password].blank?
      [:password,:password_confirmation].collect{|p| params[:user].delete(p) }
    else
      # @user.errors[:base] << "The password you entered is incorrect" unless @user.valid_password?(params[:user][:current_password])
    end

    respond_to do |format|
      # if @user.errors[:base].empty? and @user.update_with_password(user_params)
      # 1.the above line is to update user with :current_password valiudation
      # 2.U need to add   <%= f.label :current_password, t('.Current Password'), class:"col-sm-2 control-label"%>
      #   and  <%= f.password_field :current_password, class:"form-control"%> to edit view
      if @user.update_attributes(user_params)
        format.json { render :json => @user.to_json, :status => 200 }
        format.xml  { head :ok }
        format.html { redirect_to users_path, notice: '用户更新成功.'}
      else
        flash.now[:alert] = @user.errors.full_messages.join('</br>') do |msg|
        end
        format.json { render :text => "无法更新用户", :status => :unprocessable_entity } #placeholder
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        format.html { render :action => :edit, :status => :unprocessable_entity }
      end
    end

  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:js, :xml, :html)
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: '用户删除成功.' }
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, role_ids: [])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
