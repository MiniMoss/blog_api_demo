# # API token验证
module Authenticable
  protected
  def authenticate_from_token
    if current_token.try :user
      sign_in current_token.user, store:false
    else
      render json: { errors: "Not authenticated"}, status: :unauthorized
    end
  end

  def current_token
    AuthenticationToken.find_authenticated({ secret: request.headers['secret'], secret_id: request.headers['secret-id']})
  end
end
