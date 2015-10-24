class OrganizationsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    @organizations = Organization.all
  end

  def show
  end

  def new
    @organization = Organization.new
    @organization.parent_id = params[:parent_id]
  end

  def edit
  end

  def create
    @organization = Organization.new(organization_params)
    # 创建组织的用户默认成为管理者。
    @organization.admin_id = current_user.id
    respond_to do |format|
      if @organization.save
        # 建立管理员membership。
        if not Membership.new(host_type: 'Organization',
                              host_id: @organization.id,
                              user_id: current_user.id,
                              role: 'admin',
                              status: 'approved').save
          # TODO: 处理错误。
        end
        format.html { redirect_to @organization, notice: t('message.create_success', thing: t('activerecord.models.organization')) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: t('message.update_success', thing: t('activerecord.models.organization')) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: t('message.destroy_success', thing: t('activerecord.models.organization')) }
    end
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name,
                                         :logo,
                                         :short_name,
                                         :description,
                                         :admin_id,
                                         :parent_id,
                                         addresses_attributes: [
                                           :id,
                                           :name,
                                           :country,
                                           :city,
                                           :district,
                                           :zip_code,
                                           :street,
                                           :status
                                         ])
  end
end
