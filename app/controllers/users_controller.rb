class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :change_password, :change_current_organization]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if params[:user].has_key? :organization_id
      # 用户更改了所属机构，需要通过机构管理者的认证。
      params[:user][:organization_approved] = false
    end
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to session[:previous_url].last, notice: t('message.update_success', thing: t('scrinium.user')) }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to session[:previous_url].last, notice: t('message.destroy_success', thing: t('scrinium.user')) }
      format.json { head :no_content }
    end
  end

  def change_password
    respond_to do |format|
      format.html
    end
  end

  def change_current_organization
    @user.current_organization_id = params[:organization_id]
    respond_to do |format|
      if @user.save!
        format.html { redirect_to :root }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:avatar,
                                 :name,
                                 :gender,
                                 { publication_ids: [] },
                                 { group_ids: [] },
                                 :position,
                                 :email,
                                 :role,
                                 :status,
                                 :password,
                                 :password_confirmation)
  end
end
