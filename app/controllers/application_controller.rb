class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout :layout_by_resource

  # solve the ActiveModel::ForbiddenAttributesError caused by cancan
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  # cancan rescue
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to users_path
  end

  protected

  # devise登录框不加载默认layout
  def layout_by_resource
    if is_a?(Devise::SessionsController)
      'login'
    else
      'application'
    end
  end

  # API token验证 Authenticable module中
end
